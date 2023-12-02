import UIKit

final class BioViewController: UIViewController {

    @IBOutlet weak var labelBio: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelBio.text = user.person.bio.bio
    }
}
