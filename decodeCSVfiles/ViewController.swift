//
//  ViewController.swift
//  readCSVFilesswift
//
//  Created by De La Torre, Julian - Student on 10/24/22.
//

import UIKit

struct MoonPoint {
    var latitude: Double
    var longitude: Double
    var height: Double
    var slope: Double
}


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longitude = readFile(name: "longitude10x10")
        let latitude = readFile(name: "latitude10x10")
        let height = readFile(name: "height10x10")
        let slope = readFile(name: "slope10x10")
        
        var points: [[MoonPoint]] = []
        
        for y in 0...9{
            var row: [MoonPoint] = []
            for x in 0...9 {
                row.append(MoonPoint(latitude: latitude[y][x], longitude: longitude[y][x], height: height[y][x], slope: slope[y][x]))
            }
            points.append(row)
        }
        print(points)
    }
}
extension ViewController{
    func readFile(name: String) -> [[Double]] {
        var result: [[Double]] = []
        if  let url = Bundle.main.url(forResource: name , withExtension: "csv"){
            
            do{
                let s = try String(contentsOf: url)
                    //print(s)
                    
                let lines = s.split(whereSeparator: \.isNewline)
                    //print(lines.count)
                    
                for line in lines {
                    let columns = line.split(separator: ",")
                        
                    var row: [Double] = []
                
                    for column in columns {
                        if let d = Double(column){
                            row.append(d)
                                
                        }
                            
                    }
                    result.append(row)
                }
            } catch{
            }
        }
        return result
    }
}

