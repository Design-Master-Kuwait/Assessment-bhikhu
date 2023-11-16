//
//  QuestionVC.swift
//  Trivia Quiz
//
//  Created by Hetu on 30/10/23.
//

import UIKit
import SRCountdownTimer

/// Question VC hold all the  logic and view of question with option and caluclation of wrong and correct option
class QuestionVC: BaseViewController , StoryboardSceneBased {
    
    /// Storyboard variable
    static let sceneStoryboard = UIStoryboard(name: StoryboardName.home.rawValue, bundle: nil)
    
    // MARK: - IBOutlet
    @IBOutlet weak var btnNext: BaseButton!
    @IBOutlet weak var lblCurrentQuestion: AppBaseLabel!
    @IBOutlet weak var collectionOptions: UICollectionView!
    @IBOutlet weak var viewCounter: SRCountdownTimer!
    
    var arrQuestion: [ResultModel]? 
    var questionNumber: Int = 0
    var intScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    // MARK: - Private Methods
    private func configureOnViewDidLoad() {
        setupQuestionArray()
        self.collectionOptions.register(cellType: QuestionCell.self)
        self.delay(0.2) {
            self.collectionOptions.questionLayoutUI()
        }
        viewCounter.labelFont = UIFont.quicksandBold(size: FontSize.boldarge.rawValue)
        viewCounter.labelTextColor = UIColor.white
        viewCounter.timerFinishingText = "0"
        viewCounter.lineWidth = 4
        viewCounter.delegate = self
        resetTimer()
    }
    
    func resetTimer(){
        viewCounter.reset()
        viewCounter.start(beginingValue: 30, interval: 1)
        lblCurrentQuestion.text = "\(questionNumber + 1)/\(arrQuestion?.count ?? 0)"
    }

    /// setup question array we are gettign only 3 question in incorrect answer array so we need to append correct answer in random form
   private func setupQuestionArray()  {
       for i in 0..<(arrQuestion?.count ?? 0) {
           var incorrectAnswers = arrQuestion?[i].incorrectAnswers
           incorrectAnswers?.append(arrQuestion?[i].correctAnswer ?? "")
           let arrincorrectAnswers = incorrectAnswers?.shuffled()
           let indexOfA = arrincorrectAnswers?.firstIndex(of: arrQuestion?[i].correctAnswer ?? "") // 0
           arrQuestion?[i].correctAnswerIndex = indexOfA ?? 0
           arrQuestion?[i].incorrectAnswers = arrincorrectAnswers
       }
       collectionOptions.reloadData()
    }
    
    // MARK: IBActiond
    // action method on Next button click
    /// - Parameter sender: object of button
    @IBAction func btnNextTapped(_ sender: Any) {
        nextQuestionUI()
    }
    func nextQuestionUI() {
        if questionNumber >= arrQuestion?.count ?? 0 {
            
        } else {
            if questionNumber < (arrQuestion?.count ?? 0)  - 1{
                questionNumber += 1
                collectionOptions.scrollToItem(at:IndexPath(item: questionNumber, section: 0), at: .right, animated: false)
                resetTimer()
            } else {
                btnNext.setTitle(Localizable.Title.btnFinish, for: .normal)
            }
        }
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension QuestionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrQuestion?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let aQuestionCell: QuestionCell = collectionOptions.dequeueReusableCell(for: indexPath)
        if var objQuestion = arrQuestion?[indexPath.row] {
            aQuestionCell.cellConfig(with: objQuestion)
            aQuestionCell.btnAnswerTapped = { (selectdAnswer, selectedOption) in
                if !(self.arrQuestion?[indexPath.row].isAnswered ?? false){
                    objQuestion.isAnswered = true
                    objQuestion.givenAnswer = selectdAnswer
                    objQuestion.selectedOption = selectedOption
                    self.arrQuestion?[indexPath.row] = objQuestion
                    self.collectionOptions.reloadItems(at: [indexPath])
                }
            }
        }
        return aQuestionCell
    }
    
}

// MARK: - SRCountdownTimerDelegate
extension QuestionVC: SRCountdownTimerDelegate{
    func timerDidEnd(sender: SRCountdownTimer, elapsedTime: TimeInterval) {
        self.nextQuestionUI()
    }
}
