//
//  ViewController.swift
//  Animation-voice
//
//  Created by wsj on 2019/10/19.
//  Copyright © 2019 wsj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var timer: Timer?
    lazy var voiceView: VoicePrpgressView = {
        let view = VoicePrpgressView()
        let bars = Array(0..<30).map { _ in CGFloat.random(in: 0.4..<1)}
        view.barsHeight = bars
        view.barCount = 30
        view.progress = 0
        view.spacing = 2
        view.barEdgeStyle = .round
        view.barGravity = .center
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        voiceView.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(voiceView)
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func buttonClicked(_ sender: UIButton) {
        guard timer == nil else {
            timer?.invalidate()
            timer = nil
            voiceView.progress = 0
            playButton.setTitle("播放", for: .normal)
            return
        }
        playButton.setTitle("暂停", for: .normal)
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] (_) in
            self?.voiceView.progress += 0.01
        })
    }
}

