//
//  QRScannerInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit
import QRCodeReader
import AVFoundation
import AudioToolbox.AudioServices

/**
 Контроллер для сканирования QR-кода
 */
class QRScannerInfoViewController: UIViewController,QRCodeReaderViewControllerDelegate {

    /// Представление для сканирования
    lazy var scannerView: QRCodeReaderView = {
        let view = QRCodeReaderView()
        self.view.insertSubview(view, at: 0)
        view.snp.makeConstraints({ make in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view).inset(82)
        })
        return view
    }()
    
    
    /// Распознаватель кода
    lazy var reader: QRCodeReader = QRCodeReader()
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scannerView.setupComponents(showCancelButton: false, showSwitchCameraButton: false, showTorchButton: false, showOverlayView: false, reader: reader)
        
        reader.startScanning()
        reader.didFindCode = { result in
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            AudioServicesPlayAlertSound(1106)
            let message = String (format:"%@ (of type %@)", result.value, result.metadataType)
            STAlertRouter.showOk(message) {
                STRouter.pop()
            }
        }
    }
    
    /// Проверка разрешенийи готовности распознавателя
    ///
    /// - Returns: статус готовности
    private func checkScanPermissions() -> Bool {
        do {
            return try QRCodeReader.supportsMetadataObjectTypes()
        } catch let error as NSError {
            let alert: UIAlertController?
            
            switch error.code {
            case -11852:
                alert = UIAlertController(title: "Error", message: "This app is not authorized to use Back Camera.", preferredStyle: .alert)
                
                alert?.addAction(UIAlertAction(title: "Setting", style: .default, handler: { (_) in
                    DispatchQueue.main.async {
                        if let settingsURL = URL(string: UIApplicationOpenSettingsURLString) {
                            UIApplication.shared.openURL(settingsURL)
                        }
                    }
                }))
                
                alert?.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            case -11814:
                alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .alert)
                alert?.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            default:
                alert = nil
            }
            
            guard let vc = alert else { return false }
            
            present(vc, animated: true, completion: nil)
            
            return false
        }
    }
    
    /// метод делегата результата сканирования
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true) { [weak self] in
            let alert = UIAlertController(
                title: "QRCodeReader",
                message: String (format:"%@ (of type %@)", result.value, result.metadataType),
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    /// метод делегата результата камеры
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
       // let cameraName = newCaptureDevice.device.localizedName
    }
    
    /// метод делегата результата отмены
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
}
