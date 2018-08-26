
import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var runnerImageView: UIImageView!
    
    var imageArray = [UIImage]()
    
    var timer1 = Timer()
    
    var timer2 = Timer()
    
    var updateCount = 0
    
    //経過時間
    var countUp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "0"
        
         let image0 = UIImage(named: "dash0")
         let image1 = UIImage(named: "dash1")
         let image2 = UIImage(named: "dash2")
         let image3 = UIImage(named: "dash3")
         let image4 = UIImage(named: "dash4")
         let image5 = UIImage(named: "dash5")
        
        imageArray = [image0!, image1!, image2!, image3!, image4!, image5!, ]
    }
    
    
    @IBAction func run(_ sender: Any) {
        
        //タイマーをスタート
        //runnerImageViewに画像を1秒ごとに反映させていく
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            //カウントアップ
            self.countUp = self.countUp + 1
            //ラベルに反映
            self.countLabel.text = String(self.countUp)
            })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            
            
            if(self.updateCount > 5){
                
                self.updateCount = 0
        
        //タンスの中から画像を取りだして、UIImageViewに反映していく
            self.runnerImageView.image = UIImage(named: "dash0")
//             self.runnerImageView.image = UIImage(image0)
            }else{
                self.runnerImageView.image = self.imageArray[self.updateCount]
            }
            self.updateCount = self.updateCount + 1
        
        })
        
    }
    
    @IBAction func stop(_ sender: Any) {
        timer1.invalidate()
        timer2.invalidate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

