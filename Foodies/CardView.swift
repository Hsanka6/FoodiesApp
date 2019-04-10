import UIKit


class CardView: UIView{
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var numRatings: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var distanceAway: UILabel!
    @IBOutlet var starsView: UIImageView!
    @IBOutlet var openNow: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    var ratingImage: UIImage? {
        get { return starsView.image }
        set { starsView.image = newValue }
    }
    
    
    var ratings: String? {
        get { return numRatings?.text }
        set { numRatings.text = newValue }
    }
    
    var distance: String? {
        get { return distanceAway?.text }
        set { distanceAway.text = newValue }
    }
    
    var caption: String? {
        get { return label?.text }
        set { label.text = newValue }
    }
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "CardView", bundle: nil)
        
//        if openNow.text == "CLOSED"{
//            print("CCCC")
//        }
//        else{
//            print("OOO")
//        }
//
//
        
        nib.instantiate(withOwner: self, options: nil)
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        contentView.frame = bounds
        addSubview(contentView)
            
            // custom initialization logic
    }
    
}
