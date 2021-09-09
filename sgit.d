import std.stdio;
import std.getopt;
import std.process;
void main(string[] args) {
 bool initialize_repo = false;
 string initial_branch_name = "none";
 string iremote = "none";
 try {
  getopt(args, std.getopt.config.bundling, "init|i", &initialize_repo, "branch-name|b", &initial_branch_name, "remote|r", &iremote);
 } catch (GetOptException e) { writeln("bad"); }
 if (initialize_repo == true) {
  executeShell("git init");
  executeShell("git branch -M "~initial_branch_name);
  if (iremote == "none") {
   writeln("skipping remote setup. done!");
  } else {
   executeShell("git remote add origin "~iremote);
   writeln("done!");
  }
 }
}
