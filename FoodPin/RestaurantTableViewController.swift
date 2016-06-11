//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by kevin lee on 16/5/28.
//  Copyright © 2016年 kevin lee. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurants = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var images = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var resAddreses = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var resTypes = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]

    var resSelected = [Bool](count:21, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath) as! CustomTableViewCell

        // Configure the cell...
        
        //cell.textLabel?.text = restaurants[indexPath.row]
        //cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        cell.resImage.image = UIImage(named: images[indexPath.row])
        cell.resName.text = restaurants[indexPath.row]
        cell.resAddres.text = resAddreses[indexPath.row]
        cell.resType.text = resTypes[indexPath.row]
        cell.selectedImg.image = UIImage(named: "heart")
        // 设置为隐藏
        cell.selectedImg.hidden = true
        
        if resSelected[indexPath.row] {
            cell.selectedImg.hidden = false
        } else {
            cell.selectedImg.hidden = true
        }
        
        // 给已选择的单元格做标记
        // cell.accessoryType = resSelected[indexPath.row] ? .Checkmark : .None
        
        cell.resImage.layer.cornerRadius = cell.resImage.frame.size.width / 2
        
        cell.resImage.clipsToBounds = true

        return cell
    }
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 弹出提示框内容  .ActionSheet 则显示在下方，.Alert则显示在中间
        let clickAlert = UIAlertController(title: "提示", message: "您选择了餐馆：" + restaurants[indexPath.row], preferredStyle: .ActionSheet)
        // 点击取消后不做任何处理
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        // 选择拨打电话一栏后做的处理，弹出框, 闭包实现
        let dialHandler = { (action: UIAlertAction) -> Void in
            let dialAlert = UIAlertController(title: "提示", message: "您拨打的电话暂时无法接通，请稍后重试！", preferredStyle: .Alert)
            let dialResult = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            dialAlert.addAction(dialResult)
            
            self.presentViewController(dialAlert, animated: true, completion: nil)
            
        }
        // 拨打电话一栏
        let dialAction = UIAlertAction(title: "拨打电话020-8611398\(indexPath.row)", style: .Default, handler: dialHandler)
        
        let selectedAction = UIAlertAction(title: "标记为已选择", style: .Default) { (action: UIAlertAction) in
            // 获取当前选择的单元格
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            // 在单元格末尾设计一个已选择的标记
            //cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            cell.selectedImg.hidden = false // 设置图片为显示
            // 设置已选择的餐馆为true
            self.resSelected[indexPath.row] = true
        }
        
        let cancelSelectAction = UIAlertAction(title: "您是否要取消选择该项？", style: .Default) { (action: UIAlertAction) in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            cell.selectedImg.hidden = true
            self.resSelected[indexPath.row] = false
        }
        
        // 添加事件
        clickAlert.addAction(cancelAction)
        clickAlert.addAction(dialAction)
        clickAlert.addAction(selectedAction)
        clickAlert.addAction(cancelSelectAction)
        self.presentViewController(clickAlert, animated: true, completion: nil)
        
    }
    */
    
    
    // 隐藏状态栏
    /*
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            restaurants.removeAtIndex(indexPath.row)
            resTypes.removeAtIndex(indexPath.row)
            resAddreses.removeAtIndex(indexPath.row)
            resSelected.removeAtIndex(indexPath.row)
            
            //tableView.reloadData()
            // Delete the row from the data source  带有动画效果
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .Default, title: "分享") { (action, indexPath) in
            let shareAlert = UIAlertController(title: "分享", message: "Do you want to share your restaurant", preferredStyle: .ActionSheet)
            
            let qqAction = UIAlertAction(title: "QQ", style: .Default, handler: nil)
            let wxAction = UIAlertAction(title: "微信", style: .Default, handler: nil)
            let weiboAction = UIAlertAction(title: "微博", style: .Default, handler: nil)
            
            shareAlert.addAction(qqAction)
            shareAlert.addAction(wxAction)
            shareAlert.addAction(weiboAction)
            
            self.presentViewController(shareAlert, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.init(colorLiteralRed: 218 / 255, green: 225 / 255, blue: 218 / 255, alpha: 1)
        
        let delAction = UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) in
            self.restaurants.removeAtIndex(indexPath.row)
            self.resTypes.removeAtIndex(indexPath.row)
            self.resAddreses.removeAtIndex(indexPath.row)
            self.resSelected.removeAtIndex(indexPath.row)
            
            //tableView.reloadData()
            // Delete the row from the data source  带有动画效果
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        }
        
        return [shareAction, delAction]
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRestaurantDetail" {
            let detailViewController = segue.destinationViewController as! RestaurantDetailViewController
            // 将图片名字传递给下一个页面
            detailViewController.restaurantImageName
                = images[tableView.indexPathForSelectedRow!.row]
        }
    }
    

}
