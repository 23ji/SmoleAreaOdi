import NMapsMap
import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapView: NMFMapView!
//    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // setupMapView()
//        setupLocationManager()
    }

//    func setupMapView() {
//        mapView = NMFMapView(frame: view.frame)
//        view.addSubview(mapView)
//    }
//
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization() // 위치 권한 요청
//        locationManager.startUpdatingLocation() // 위치 업데이트 시작
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.first else { return }
//        let lat = location.coordinate.latitude
//        let lng = location.coordinate.longitude
//
//        // 지도 중심 이동
//        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat, lng: lng))
//        mapView.moveCamera(cameraUpdate)
//
//        // 현재 위치 마커 표시
//        let marker = NMFMarker()
//        marker.position = NMGLatLng(lat: lat, lng: lng)
//        marker.mapView = mapView
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("위치 정보를 가져오지 못했습니다: \(error.localizedDescription)")
//    }
}



