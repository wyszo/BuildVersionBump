import Foundation

struct OSTaskExecutor
{
    func systemCommandWithLaunchPath(launchPath: String, arguments: String) -> String? {
        let task = NSTask()
        task.launchPath = launchPath
        task.arguments = arguments.characters.split{$0 == " "}.map(String.init);

        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data:data, encoding:NSUTF8StringEncoding) as String?
        return output
    }
}