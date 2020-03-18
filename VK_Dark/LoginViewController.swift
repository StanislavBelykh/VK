//
//  LoginViewController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 20.09.2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var loginInput: UITextField!
  @IBOutlet weak var passwordInput: UITextField!
  @IBAction func interLogin(_ sender: Any) {
  }
  @IBOutlet weak var lightButton: UIButton!
  
  //Подсветка кнопки
  

  @objc func keyboardWasShow (notification: Notification) {
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue) .cgRectValue.size
    let contentInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    
    self.scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets
  
  }
  @objc func keyboardWillBeHidden(notification: NSNotification) {
    
    let contentInsets = UIEdgeInsets.zero
    scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets
  }
  //Метод для скрытия клавиатуры
  @objc func hideKeyboard() {
    self.scrollView?.endEditing(true)
  }
  
  func checkUserDate() -> Bool {
    let login = loginInput.text!
    let password = passwordInput.text!
    
    if login == "" && password == "" {
          return true
    }
        else {
          return false
    }
  }
  func showLoginError() {
      //Создаем контроллер
      let alter = UIAlertController(title: "Ошибка", message: "Введен не верный пароль или имя пользователя", preferredStyle:  .alert)
      //Создаем кнопку для UIAlertController
      let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      //Добавляем кнопку для UIAlertController
      alter.addAction(action)
      //Показываем UIAlertController
      present(alter, animated: true, completion: nil)
    }
 
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //Проверка данных
    let checkResult = checkUserDate()
    
    if !checkResult {
      showLoginError()
    }
    
    return checkResult
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()

   

    
    
    let hideKeyboardGesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
    
    scrollView?.addGestureRecognizer (hideKeyboardGesture)
        // Do any additional setup after loading the view.
    }
 
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    
    //Подписываемся на уведомления о клавиатуре
    //При появлении
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    //Когда пропадает
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillShowNotification, object: nil)
  
  }
  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
    
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
     NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
  
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//class LightForButton: UIView {
//
//  override func awakeFromNib() {
//    super.awakeFromNib()
//
//
//    layer.shadowColor = UIColor.white.cgColor
//    layer.shadowRadius = 10
//    layer.shadowOpacity = 0.7
//    layer.shadowOffset = .zero
//
//
//  }
//}
