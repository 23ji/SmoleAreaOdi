import CoreLocation //GPS와 관련된 위치 정보를 다룰 수 있도록 하는 Apple의 프레임워크
import NMapsMap //네이버 지도 SDK로, 네이버 지도를 앱에 표시하거나 사용자 위치를 관리할 때 사용

        // 앱 화면에 지도를 표시할 메인 뷰 컨트롤러
class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    // 위치 관리자 초기화 / CLLocationManager 객체를 생성 / 이 객체를 통해 GPS 정보를 가져오고, 위치 권한 요청 등을 처리할 수 있음.
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //현재 뷰 컨트롤러의 크기와 동일한 크기로 초기화
        let naverMapView = NMFNaverMapView(frame: view.frame)
        
        //네이버 지도 뷰를 현재 ViewController의 뷰 계층에 추가하여 화면에 보이게 함.
        view.addSubview(naverMapView)
        
        
    }
}
