import QtQuick 2.0

import com.genivi.rvitrafficservice 1.0

Item {
    id: root

    property string backendDeviceId: "genivi.org/backend/"
    property string remoteServiceName: "hello"

    signal trafficEvent(string eventId, string eventTitle, string eventExplanation)
    signal speedEvent(string speedLimit, bool speeding)

    signal reportAvailable(string position, string speed)

    Component.onCompleted: {
        RviNode.nodeInit()


    }

    Connections {
        target: RviNode

        // Errors
        onRviInitFailure: console.log("Error: Failed to initialize RVI")
        onRviBadHandle: console.log("Error: Invalid RVI handle")
        onRviNodeRegisterServiceError: console.log("Error: RVI node failed to register service")
        onRviProcessInputFailure: console.log("Error: Process input failure")

        // Successes
        onRviInitialized: {
            console.log("Success! RVI Node initialized.")
            RviNode.nodeConnect("38.129.64.41", "9007")

            RviNode.registerService(trafficService.serviceName, trafficService)
            RviNode.registerService(speedService.serviceName, speedService)
        }
        onRviRemoteNodeConnected: {
            console.log("Success! Connected to remote node")
            RviNode.invokeService("genivi.org/backend/hello", '{"one":1}');
            root.reportAvailable("myposition", "myspeed")
        }
        onNewActiveConnection: console.log("RVI Node has new active connections")
        onRviNodeRegisterServiceSuccess: console.log("Registered the " + serviceName + " service!")
        onRviProcessInputSuccess: console.log("Process input success")
        onRviNodeInvokeServiceSuccess: console.log("Invoked service " + serviceName + " with parameters " + parameters)
    }

    onReportAvailable: {
        var serviceName = backendDeviceId + remoteServiceName
        console.log("ServiceName: " + serviceName)
        var parameters = '{"pos":"' + position + '", "speed":"' + speed + '"}'
        console.log("Parameters: " + parameters)
        RviNode.invokeService(serviceName, parameters)
    }

    RviTrafficService {
        id: trafficService

        serviceName: "traffic/alert"

        onNotifyHmi: {
            root.trafficEvent(eventId, eventTitle, eventExplanation)
        }
    }

    RviSpeedService {
        id: speedService

        serviceName: "speed/alert"

        onNotifyHmi: {
            console.log("Got a speed event with limit " + eventSpeedLimit + ". Currently speeding? " + eventOverSpeed)
            console.log("Got a large string: " + eventLargeString)
            root.speedEvent(eventSpeedLimit, eventOverSpeed)
        }
    }
}
