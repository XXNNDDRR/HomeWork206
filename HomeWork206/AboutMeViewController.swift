import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelWork: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = user.person.name
        labelSurname.text = user.person.surname
        labelAge.text = user.person.age
        labelWork.text = user.person.work

    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        guard let thirdVC = segue.destination as? BioViewController else {
            return
        }
        thirdVC.user = user
        thirdVC.title = "\(user.person.name) \(user.person.surname) bio"
    }
}
