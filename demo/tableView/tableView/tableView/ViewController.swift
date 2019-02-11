//
//  ViewController.swift
//  tableView
//
//  Created by wsj on 2019/2/11.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    lazy var customView = CustomHeaderView()
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    @IBOutlet var segment: UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setCustomViewContent()
        segment?.addTarget(self, action: #selector(tapSegemntControl(_:)), for: .valueChanged)
    }
    
    func addSubViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        tableView.tableHeaderView = customView
        customView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalTo(view) // 确定的宽度，高度由子视图决定
        }
    }
    
    func setCustomViewContent() {
        customView.content.text = "患难及困苦，是磨炼人格的最高学府；——苏格拉底。不认识痛苦，就不是一条好汉。——雨果；永远不要因承认错误而感到羞耻，因为承认错误也可以解释作你今天更聪敏。——马罗；"
        customView.info.text = "自古奇人伟士，不屈折于忧患，则不足以其学。——方孝孺；世上最可贵的是时间，世上最奢靡的是挥霍时光。——莫扎特；我要扼住命运的咽喉，它决不能使我完全屈服。——贝多芬；无论是美女的歌声，还是鬣狗的狂吠，无论是鳄鱼的眼泪，还是恶狼的嚎叫，都不会使我动摇。——恰普曼；成功＝艰苦的劳动＋正确的方法＋少说空话。——爱因斯坦；"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.wj_sizeHeaderToFit()
    }

    
    @objc func tapSegemntControl(_ segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            customView.content.text = "永远不要因承认错误而感到羞耻，因为承认错误也可以解释作你今天更聪敏。——马罗；"
            customView.info.text = "书籍并不是没有生命的东西，它包藏着一种生命的潜力，与作者同样地活跃。不仅如此，它还像一个宝瓶，把作者生机勃勃的智慧中最纯净的精华保存起来。——弥尔顿"
        } else {
            customView.content.text = " ——佚名永远不要因承认错误而感到羞耻，因为承认错误也可以解释作你今天更聪敏。——马罗；自己打败自己是最可悲的失败，自己战胜自己是最可贵的胜利。 ——佚名永远不要因承认错误而感到羞耻，因为承认错误也可以解释作你今天更聪敏。——马罗；自己打败自己是最可悲的失败，自己战胜自己是最可贵的胜利。 ——佚名"
            customView.info.text = "书籍并不是没有生命的东西，它包藏着一种生命的潜力，与作者同样地活跃。不仅如此，它还像一个宝瓶，把作者生机勃勃的智慧中最纯净的精华保存起来。——弥尔顿书籍并不是没有生命的东西，它包藏着一种生命的潜力，与作者同样地活跃。不仅如此，它还像一个宝瓶，把作者生机勃勃的智慧中最纯净的精华保存起来。——弥尔顿书籍并不是没有生命的东西，它包藏着一种生命的潜力，与作者同样地活跃。不仅如此，它还像一个宝瓶，把作者生机勃勃的智慧中最纯净的精华保存起来。——弥尔顿"
        }

        tableView.wj_sizeHeaderToFit()
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)"
        return cell
    }
}
class CustomHeaderView: UIView {
    lazy var content: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    lazy var info: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = UIColor.gray
        addSubview(content)
        addSubview(info)
        addConstraints()
    }
    
    func addConstraints() {
        content.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview().inset(10)
        }
        info.snp.makeConstraints { (make) in
            make.left.equalTo(content)
            make.right.equalTo(-50)
            make.top.equalTo(content.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        content.preferredMaxLayoutWidth = content.bounds.width
        info.preferredMaxLayoutWidth = info.bounds.width
    }
}

