import NMapsMap
import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
      super.viewDidLoad()
      //네이버 지도 화면 띄우기
      let mapView = NMFMapView(frame: view.frame)
      view.addSubview(mapView)
  }
}
