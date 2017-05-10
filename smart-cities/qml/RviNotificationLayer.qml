import QtQuick 2.0
import QtPositioning 5.3

import com.genivi.rvitrafficservice 1.0

Item {
    id: root

    property string backendDeviceId: "genivi.org/backend/"
    property string remoteServiceName: "obu-data-recipient"

    signal trafficEvent(string title, string explanation, url icon)
    signal speedEvent(string speedLimit, bool speeding)

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
        }
        onNewActiveConnection: console.log("RVI Node has new active connections")
        onRviNodeRegisterServiceSuccess: console.log("Registered the " + serviceName + " service!")
        onRviProcessInputSuccess: console.log("Process input success")
        onRviNodeInvokeServiceSuccess: console.log("Invoked service " + serviceName + " with parameters " + parameters)
    }

    RviTrafficService {
        id: trafficService

        serviceName: "traffic/alert"

        onNotifyHmi: {
            var title; var explanation; var icon;
            console.log("Got notify HMI! Event ID: " + eventId)
            switch(parseInt(eventId)) {
            case 1: / ** Speed alert */
                console.warn("ERROR: Received use case 1 as a traffic warning")
                break;
            case 2: /** High-risk pedestrian warning */
                console.log("Received a pedestrian area warning")
                title = eventTitle ? eventTitle : "Caution"
                explanation = eventExplanation ? eventExplanation : "High Pedestrian Area"
                icon = colors.isNightMode ? "qrc:/assets/alert_night_pedestrian.png" : "qrc:/assets/alert_ped.png"
                break;
            case 3: /** Bus stop warning */
                console.log("Received a bus stop warning");
                title = eventTitle ? eventTitle : "Caution"
                explanation = eventExplanation ? eventExplanation : "Bus Stop Ahead"
                icon = colors.isNightMode ? "qrc:/assets/alert_night_bus.png" : "qrc:/assets/alert_bus.png"
                break;
            case 4: /** Traffic Jam warning */
                console.log("Received a traffic jam warning");
                title = eventTitle ? eventTitle : "Traffic Jam"
                explanation = eventExplanation ? eventExplanation : "Major Delay"
                icon = colors.isNightMode ? "qrc:/assets/alert_night_traffic.png" : "qrc:/assets/alert_traffic.png"
                break;
            default:
                console.log("Just hanging out here in the switch")
                break;
            }
            root.trafficEvent(title, explanation, icon)
        }
    }

    RviSpeedService {
        id: speedService

        serviceName: "speed/alert"

        onNotifyHmi: {
            console.log("Got a speed event with limit " + eventSpeedLimit + ". Currently speeding? " + eventOverSpeed)
            root.speedEvent(eventSpeedLimit, eventOverSpeed)
        }
    }

    PositionSource {
        id: v2xsource
        active: true
        updateInterval: 1000
        onPositionChanged: {
            var gpsData = []

            var altitudeData = {}
            altitudeData["source"] = "Signal.Cabin.Infotainment.Navigation.CurrentLocation.Altitude"
            altitudeData["value"] = position.coordinate.altitude
            altitudeData["time"] = position.timestamp
            gpsData.push(altitudeData)

            var latitudeData = {}
            latitudeData["source"] = "Signal.Cabin.Infotainment.Navigation.CurrentLocation.Latitude"
            latitudeData["value"] = position.coordinate.latitude
            latitudeData["time"] = position.timestamp
            gpsData.push(latitudeData)

            var longitudeData = {}
            longitudeData["source"] = "Signal.Cabin.Infotainment.Navigation.CurrentLocation.Longitude"
            longitudeData["value"] = position.coordinate.longitude
            longitudeData["time"] = position.timestamp
            gpsData.push(longitudeData)

            var speedData = {}
            speedData["source"] = "Signal.Cabin.Infotainment.Navigation.CurrentLocation.Speed"
            speedData["value"] = position.speed
            speedData["time"] = position.timestamp
            gpsData.push(speedData)

            var headingData = {}
            headingData["source"] = "Signal.Cabin.Infotainment.Navigation.CurrentLocation.Heading"
            headingData["value"] = position.direction
            headingData["time"] = position.timestamp
            gpsData.push(headingData)

            var accuracyData = {}
            accuracyData["source"] = "Signal.Cabin.Infotainment.Navigation.CurrentLocation.Accuracy"
            accuracyData["value"] = position.horizontalAccuracy
            accuracyData["time"] = position.timestamp
            gpsData.push(accuracyData)

            var params = {}
            params["gpsData"] = gpsData

            var paramsString = JSON.stringify(params)

            var serviceName = backendDeviceId + remoteServiceName

            console.log("SERVICE NAME: " + serviceName + " PARAMS: " + paramsString)
            RviNode.invokeService(serviceName, paramsString)
        }
    }
}
