import UIKit
import Cosmos
import CDYelpFusionKit
import Kingfisher

class CardView: UIView{
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var numRatings: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var distanceAway: UILabel!
    @IBOutlet var openNow: UILabel!
    @IBOutlet var starsView: CosmosView!
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

        
        nib.instantiate(withOwner: self, options: nil)
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        contentView.frame = bounds
        addSubview(contentView)    }
    
    func setUpCard(business: CDYelpBusiness){
        imageView.kf.setImage(with: business.imageUrl)
        // customCardView.ratingImage?.kf.setImage(with:restaurants[index].)
        
        let milesAway = business.distance!/1609.344
        let strMiles = String(format: "%.1f", milesAway)
        distanceAway.text = strMiles + " mi"
        numRatings.text = "(" + String(describing: business.reviewCount!) + ")"
        label.text = business.name
        starsView.settings.fillMode = .half
        if let rat = business.rating{
            starsView.rating = rat
        }
        
        if let pri = business.price {
            priceLabel.text = getPrice(price: pri)
        }
        
        if let closed = business.isClosed {
            if closed{
                openNow.text = "CLOSED"
                openNow.textColor = UIColor.red
            }
            openNow.text = "OPEN"
            openNow.textColor = UIColor.green
        }
        
        
    }
    func getPrice(price:String) -> String{
        var p:String = ""
        switch price {
        case "$":
            p = "$1 - $10"
            break
        case "$$":
            p = "$11 - $30"
            break
        case "$$$":
            p = "$31 - $60"
            break
        case "$$$$":
            p = "$61+"
            break
        default:
            p = "N/A"
        }
        return p
    }
    
}
