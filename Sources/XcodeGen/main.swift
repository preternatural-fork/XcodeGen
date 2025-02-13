import FoundationX
import ProjectSpec
import XcodeGenCLI

let version = Version("2.42.0")
let cli = XcodeGenCLI(version: version)
cli.execute()
