//
//  QuestionCell.swift
//  Trivia Quiz
//
//  Created by Hetu on 01/11/23.
//
import UIKit
class QuestionCell: UICollectionViewCell, NibReusable  {
    
    // MARK: - IB Outlets
    @IBOutlet weak var lblQuestion: AppBaseLabel!
    @IBOutlet var lblOptions: [AppBaseLabel]!
    @IBOutlet var viewOption: [BaseUIControl]!
    
    var btnAnswerTapped: ((String, Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /// Cell config with object
    /// - Parameter object: ResultModel
    func cellConfig(with object: ResultModel)  {
        lblQuestion.text = object.question.removeSpecialCharsFromString
        lblOptions[0].text = object.incorrectAnswers?[0]
        lblOptions[1].text = object.incorrectAnswers?[1]
        lblOptions[2].text = object.incorrectAnswers?[2]
        lblOptions[3].text = object.incorrectAnswers?[3]
        if object.isAnswered {
            for option in viewOption  {
                if option.tag == object.correctAnswerIndex {
                    option.backgroundColor = UIColor.Color.greenCorrectAnswer
                } else {
                    option.backgroundColor = UIColor.Color.clear
                }
            }
            viewOption[object.selectedOption].backgroundColor = lblOptions[object.selectedOption].text == object.correctAnswer ? UIColor.Color.greenCorrectAnswer : UIColor.Color.redInCorrectAnswer
        }
    }
    
    // MARK: IBActiond
    // action method on Next button options click
    /// - Parameter sender: object of button
    @IBAction func btnOptionTapped(_ sender: BaseUIControl) {
        btnAnswerTapped?(lblOptions[sender.tag].text ?? "", sender.tag)
    }
}
