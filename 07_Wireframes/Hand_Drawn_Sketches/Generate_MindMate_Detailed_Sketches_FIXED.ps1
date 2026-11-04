# MindMate AI - Detailed low-fidelity mobile wireframe generator
# Compatible with Windows PowerShell 5.1. ASCII-only source to avoid encoding issues.

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$outDir = Join-Path $root 'Detailed_Sketches'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$script:svg = New-Object System.Collections.Generic.List[string]
function Add-Raw([string]$s) { [void]$script:svg.Add($s) }
function E([string]$s) { return [System.Security.SecurityElement]::Escape($s) }
function Rect([int]$x,[int]$y,[int]$w,[int]$h,[string]$fill='#FFFFFF',[string]$stroke='#333333',[int]$r=12,[int]$sw=2) {
  Add-Raw "<rect x='$x' y='$y' width='$w' height='$h' rx='$r' fill='$fill' stroke='$stroke' stroke-width='$sw'/>"
}
function Txt([int]$x,[int]$y,[string]$t,[int]$size=16,[string]$weight='400',[string]$fill='#202020') {
  $v = E $t
  Add-Raw "<text x='$x' y='$y' font-family='Arial, sans-serif' font-size='$size' font-weight='$weight' fill='$fill'>$v</text>"
}
function Line([int]$x1,[int]$y1,[int]$x2,[int]$y2,[string]$stroke='#777777',[int]$sw=1) {
  Add-Raw "<line x1='$x1' y1='$y1' x2='$x2' y2='$y2' stroke='$stroke' stroke-width='$sw'/>"
}
function Button([int]$y,[string]$label,[bool]$primary=$true) {
  if ($primary) { Rect 36 $y 358 48 '#E8E8E8' '#222222' 10 2 } else { Rect 36 $y 358 46 '#FFFFFF' '#555555' 10 1 }
  Txt 215 ($y+30) $label 16 '700' '#222222'
  # center text alignment
  $last = $script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'")
  $script:svg[$script:svg.Count-1] = $last
}
function Field([int]$y,[string]$label,[string]$placeholder) {
  Txt 38 $y $label 14 '700'
  Rect 36 ($y+10) 358 46 '#FFFFFF' '#777777' 8 1
  Txt 50 ($y+39) $placeholder 14 '400' '#777777'
}
function Card([int]$y,[string]$title,[string]$sub,[string]$right='') {
  Rect 36 $y 358 74 '#FFFFFF' '#777777' 10 1
  Txt 52 ($y+28) $title 15 '700'
  Txt 52 ($y+52) $sub 12 '400' '#555555'
  if ($right -ne '') { Txt 370 ($y+39) $right 12 '700' '#333333'; $last=$script:svg[$script:svg.Count-1].Replace("x='370'", "x='370' text-anchor='end'"); $script:svg[$script:svg.Count-1]=$last }
}
function Check([int]$x,[int]$y,[string]$label,[bool]$checked=$false) {
  Rect $x $y 18 18 '#FFFFFF' '#444444' 3 1
  if ($checked) { Line ($x+4) ($y+9) ($x+8) ($y+14) '#222222' 2; Line ($x+8) ($y+14) ($x+15) ($y+4) '#222222' 2 }
  Txt ($x+27) ($y+14) $label 13 '400'
}
function Nav([string]$active='Home') {
  Line 24 817 406 817 '#777777' 1
  $items = @(
    [pscustomobject]@{Name='Home';X=55},
    [pscustomobject]@{Name='Planner';X=145},
    [pscustomobject]@{Name='AI Help';X=245},
    [pscustomobject]@{Name='Progress';X=345}
  )
  foreach ($it in $items) {
    $name=[string]$it.Name; $x=[int]$it.X
    $color='#555555'; if ($name -eq $active) {$color='#111111'}
    # simple icon placeholder and label
    Rect ($x-12) 829 24 19 '#FFFFFF' $color 4 1
    Txt $x 866 $name 10 '700' $color
    $last=$script:svg[$script:svg.Count-1].Replace("x='$x'", "x='$x' text-anchor='middle'")
    $script:svg[$script:svg.Count-1]=$last
  }
}
function BeginScreen([string]$title,[string]$step='') {
  $script:svg = New-Object System.Collections.Generic.List[string]
  Add-Raw "<svg xmlns='http://www.w3.org/2000/svg' width='430' height='900' viewBox='0 0 430 900'>"
  Add-Raw "<rect width='430' height='900' fill='#F7F7F7'/>"
  # phone outline and content canvas
  Rect 12 10 406 880 '#FFFFFF' '#222222' 24 3
  Txt 34 43 '9:41' 12 '700'
  Txt 350 43 'signal  wifi  battery' 10 '400'
  Line 24 58 406 58 '#AAAAAA' 1
  Txt 34 91 'MindMate AI' 15 '700'
  if ($step -ne '') { Txt 396 91 $step 11 '400' '#666666'; $last=$script:svg[$script:svg.Count-1].Replace("x='396'", "x='396' text-anchor='end'"); $script:svg[$script:svg.Count-1]=$last }
  Line 24 108 406 108 '#DDDDDD' 1
  Txt 34 145 $title 23 '700'
}
function EndScreen([string]$file,[string]$active='') {
  if ($active -ne '') { Nav $active }
  Add-Raw '</svg>'
  $path = Join-Path $outDir $file
  $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
  [System.IO.File]::WriteAllLines($path, [string[]]$script:svg.ToArray(), $utf8NoBom)
  Write-Host ("Created: " + $path)
}

# 01 Welcome
BeginScreen 'Your study life, made simpler' '01 / 13'
Txt 215 220 ' [ MindMate mark ] ' 22 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 215 275 'Plan calmly. Learn confidently.' 16 '400'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 215 305 'A personal space for your study tasks,' 13 '400' '#555555'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 215 326 'AI learning help and progress.' 13 '400' '#555555'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Button 500 'Create an account' $true
Button 560 'Sign in' $false
Txt 215 650 'You stay in control of your study plan.' 12 '400' '#555555'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
EndScreen '01_Welcome.svg'

# 02 Sign in
BeginScreen 'Welcome back' '02 / 13'
Txt 36 181 'Sign in to continue your study plan.' 13 '400' '#555555'
Field 235 'Email address' 'name@example.com'
Field 325 'Password' 'Enter your password'
Txt 394 418 'Forgot password?' 12 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='394'", "x='394' text-anchor='end'"); $script:svg[$script:svg.Count-1]=$last
Button 465 'Sign in' $true
Txt 215 560 'OR' 12 '700' '#666666'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Button 590 'Continue with Google' $false
Txt 215 690 "New to MindMate AI?  Create account" 12 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
EndScreen '02_Sign_In.svg'

# 03 Create account
BeginScreen 'Create your account' '03 / 13'
Txt 36 181 'Set up your account to keep your study work together.' 12 '400' '#555555'
Field 220 'Full name' 'Enter your name'
Field 310 'Email address' 'name@example.com'
Field 400 'Password' 'At least 8 characters'
Field 490 'Confirm password' 'Re-enter password'
Check 38 580 'I agree to the terms and privacy notice' $false
Button 630 'Create account' $true
Txt 215 715 'Already have an account?  Sign in' 12 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
EndScreen '03_Create_Account.svg'

# 04 Onboarding
BeginScreen 'Set up your study space' '04 / 13'
Txt 36 178 'Choose your subjects. You can edit these later.' 12 '400' '#555555'
Field 215 'Add a subject' 'e.g. Data Structures'
Button 280 '+ Add subject' $false
Txt 38 375 'Your subjects' 15 '700'
Check 40 400 'Data Structures' $true
Check 40 438 'Statistics' $true
Check 40 476 'Database Management' $false
Check 40 514 'Human Computer Interaction' $true
Txt 38 580 'Preferred study session' 14 '700'
Check 40 606 'Morning' $false
Check 205 606 'Afternoon' $true
Check 40 644 'Evening' $false
Button 710 'Save and continue' $true
EndScreen '04_Onboarding.svg'

# 05 Mood optional
BeginScreen 'How are you feeling today?' '05 / 13'
Txt 36 180 'Optional: this can help tailor study suggestions.' 12 '400' '#555555'
$moods=@(@('Focused',235),@('Okay',310),@('Tired',385),@('Stressed',460),@('Not sure',535))
foreach($m in $moods){ Rect 36 ([int]$m[1]) 358 54 '#FFFFFF' '#777777' 9 1; Txt 60 ([int]$m[1]+33) ([string]$m[0]) 15 '400' }
Txt 36 630 'This is not a health assessment.' 12 '400' '#555555'
Button 680 'Continue' $true
Button 740 'Skip for now' $false
EndScreen '05_Optional_Mood.svg'

# 06 Home dashboard
BeginScreen 'Good morning!' '06 / 13'
Txt 36 177 'Here is your next step.' 13 '400' '#555555'
Rect 36 198 358 118 '#F0F0F0' '#555555' 12 1
Txt 54 228 'NEXT STUDY TASK' 11 '700' '#555555'
Txt 54 257 'Review database normalization' 16 '700'
Txt 54 283 'Database Management  |  45 min' 12 '400' '#555555'
Txt 54 302 'Due today, 4:00 PM' 11 '400' '#555555'
Button 335 'Open task' $true
Txt 36 430 'Your plan today' 16 '700'
Card 450 'Statistics revision' '10:00 AM - 10:40 AM' 'Pending'
Card 535 'Database practice' '2:00 PM - 2:45 PM' 'Next'
Txt 36 635 'Quick actions' 15 '700'
Button 655 '+ Add a study task' $false
Button 713 'Ask AI for learning help' $false
Nav 'Home'
EndScreen '06_Home_Dashboard.svg'

# 07 Add task
BeginScreen 'Add a study task' '07 / 13'
Txt 36 177 'Add the details needed for a suggested plan.' 12 '400' '#555555'
Field 215 'Subject' 'Choose a subject'
Field 305 'Topic or task' 'e.g. Practice SQL joins'
Field 395 'Deadline' 'Select date and time'
Field 485 'Available study time' 'e.g. 2 hours per week'
Txt 38 585 'Task priority' 14 '700'
Check 40 611 'High' $false
Check 155 611 'Medium' $true
Check 300 611 'Low' $false
Txt 36 670 'You can edit or reschedule this task later.' 11 '400' '#555555'
Button 720 'Generate suggested schedule' $true
EndScreen '07_Add_Study_Task.svg' 'Planner'

# 08 Review plan
BeginScreen 'Review your suggested plan' '08 / 13'
Txt 36 178 'Suggestion only - confirm it when it works for you.' 12 '400' '#555555'
Card 220 'Database normalization' 'Tue 4:00 PM - 4:45 PM' 'Edit'
Card 310 'Practice SQL joins' 'Wed 10:00 AM - 10:30 AM' 'Move'
Card 400 'Review lecture notes' 'Thu 3:00 PM - 3:30 PM' 'Remove'
Txt 36 510 'Plan controls' 14 '700'
Button 535 'Edit selected study block' $false
Button 593 'Move to another time' $false
Button 651 'Remove study block' $false
Button 725 'Confirm and save plan' $true
EndScreen '08_Review_Suggested_Plan.svg' 'Planner'

# 09 Study workspace
BeginScreen 'Study task workspace' '09 / 13'
Rect 36 175 358 98 '#F0F0F0' '#777777' 10 1
Txt 52 205 'DATABASE MANAGEMENT' 11 '700' '#555555'
Txt 52 233 'Practice SQL joins' 17 '700'
Txt 52 255 'Due Wed  |  Planned 30 minutes' 11 '400' '#555555'
Txt 36 315 'Choose learning support' 15 '700'
Card 340 'AI explanation or summary' 'Ask about a topic in this task' 'Open'
Card 430 'Short topic quiz' 'Practise and review answers' 'Open'
Card 520 'Related notes and resources' 'Open a note, video or practical' 'Open'
Txt 36 630 'Task status' 14 '700'
Check 40 660 'Not started' $false
Check 40 695 'In progress' $true
Check 215 695 'Complete' $false
Button 745 'Save task status' $true
Nav 'Planner'
EndScreen '09_Study_Task_Workspace.svg' 'Planner'

# 10 AI help
BeginScreen 'AI learning help' '10 / 13'
Rect 36 175 358 85 '#F0F0F0' '#777777' 10 1
Txt 52 202 'CURRENT TASK: Practice SQL joins' 11 '700'
Txt 52 228 'Database Management' 12 '400' '#555555'
Txt 36 295 'What would you like help with?' 14 '700'
Rect 36 315 358 92 '#FFFFFF' '#777777' 9 1
Txt 52 345 'Type your question about this topic...' 12 '400' '#777777'
Txt 52 370 'Example: Explain INNER JOIN simply.' 11 '400' '#888888'
Button 425 'Ask AI' $true
Txt 36 510 'AI RESPONSE' 12 '700' '#555555'
Rect 36 530 358 165 '#FFFFFF' '#777777' 9 1
Txt 52 560 'A JOIN combines rows from related tables.' 13 '400'
Txt 52 585 'INNER JOIN returns rows with matching' 13 '400'
Txt 52 606 'values in both tables.' 13 '400'
Line 52 630 378 630 '#BBBBBB' 1
Txt 52 653 'Sources: show available source details here.' 10 '400' '#555555'
Txt 36 720 'AI output may contain errors. Check key facts.' 10 '400' '#555555'
Button 755 'Return to current task' $false
EndScreen '10_AI_Learning_Help.svg' 'AI Help'

# 11 Quiz
BeginScreen 'Quick topic quiz' '11 / 13'
Txt 36 177 'Practice SQL joins  |  Question 1 of 5' 12 '400' '#555555'
Rect 36 210 358 115 '#F0F0F0' '#777777' 10 1
Txt 52 242 'Which JOIN returns only matching rows' 14 '700'
Txt 52 266 'from both tables?' 14 '700'
Check 44 365 'INNER JOIN' $true
Check 44 415 'LEFT JOIN' $false
Check 44 465 'RIGHT JOIN' $false
Check 44 515 'CROSS JOIN' $false
Button 590 'Check answer' $true
Rect 36 665 358 65 '#FFFFFF' '#777777' 9 1
Txt 52 692 'Feedback appears after checking your answer.' 11 '400' '#555555'
Button 755 'Return to study task' $false
EndScreen '11_Quiz_Practice.svg'

# 12 Progress
BeginScreen 'Your study progress' '12 / 13'
Txt 36 178 'A simple view of your recent study activity.' 12 '400' '#555555'
Rect 36 205 108 90 '#F0F0F0' '#777777' 8 1
Txt 90 240 '6' 25 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='90'", "x='90' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 90 270 'Completed' 11 '400'; $last=$script:svg[$script:svg.Count-1].Replace("x='90'", "x='90' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Rect 161 205 108 90 '#F0F0F0' '#777777' 8 1
Txt 215 240 '3' 25 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 215 270 'Pending' 11 '400'; $last=$script:svg[$script:svg.Count-1].Replace("x='215'", "x='215' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Rect 286 205 108 90 '#F0F0F0' '#777777' 8 1
Txt 340 240 '2' 25 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='340'", "x='340' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 340 270 'In progress' 10 '400'; $last=$script:svg[$script:svg.Count-1].Replace("x='340'", "x='340' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 36 345 'Weekly overview' 15 '700'
Rect 36 365 358 150 '#FFFFFF' '#777777' 8 1
Line 62 485 370 485 '#777777' 1
Line 62 390 62 485 '#777777' 1
foreach($x in @(95,140,185,230,275,320,365)){ Line $x 390 $x 485 '#EEEEEE' 1 }
foreach($p in @(
  [pscustomobject]@{X=95;Y=450},[pscustomobject]@{X=140;Y=430},
  [pscustomobject]@{X=185;Y=440},[pscustomobject]@{X=230;Y=405},
  [pscustomobject]@{X=275;Y=420},[pscustomobject]@{X=320;Y=395},
  [pscustomobject]@{X=365;Y=410}
)){ Rect ([int]$p.X-9) ([int]$p.Y) 18 (485-[int]$p.Y) '#D8D8D8' '#555555' 2 1 }
Txt 36 555 'Upcoming tasks' 15 '700'
Card 575 'Finish SQL practice' 'Due tomorrow' 'Pending'
Card 660 'Review statistics notes' 'Due Friday' 'Pending'
Button 750 'Reschedule unfinished tasks' $false
Nav 'Progress'
EndScreen '12_Progress_Dashboard.svg' 'Progress'

# 13 Profile and settings
BeginScreen 'Profile and settings' '13 / 13'
Rect 36 175 358 105 '#F0F0F0' '#777777' 10 1
Rect 54 195 62 62 '#FFFFFF' '#555555' 31 1
Txt 85 233 'U' 24 '700'; $last=$script:svg[$script:svg.Count-1].Replace("x='85'", "x='85' text-anchor='middle'"); $script:svg[$script:svg.Count-1]=$last
Txt 135 215 'Student name' 16 '700'
Txt 135 240 'student@example.com' 12 '400' '#555555'
Txt 36 325 'Account' 14 '700'
Card 345 'Personal details' 'Edit your name and email' 'Open'
Card 430 'Subjects and preferences' 'Update your study subjects' 'Open'
Txt 36 535 'Study preferences' 14 '700'
Card 555 'Reminders' 'Choose timing and frequency' 'Open'
Card 640 'Privacy and AI information' 'Review how information is used' 'Open'
Button 735 'Sign out' $false
EndScreen '13_Profile_Settings.svg'

# Write an index and a readme.
$index = @(
'MINDMATE AI - DETAILED LOW-FIDELITY WIREFRAMES',
'Each SVG is a separate 430 x 900 mobile screen. Open in Edge or import into Figma.',
'01 Welcome', '02 Sign In', '03 Create Account', '04 Onboarding', '05 Optional Mood',
'06 Home Dashboard', '07 Add Study Task', '08 Review Suggested Plan', '09 Study Task Workspace',
'10 AI Learning Help', '11 Quiz Practice', '12 Progress Dashboard', '13 Profile Settings',
'Note: These are digital low-fidelity wireframes, not photographic evidence of hand-drawn sketches.'
)
[System.IO.File]::WriteAllLines((Join-Path $outDir 'README.txt'), $index, (New-Object System.Text.UTF8Encoding($false)))
Write-Host ''
Write-Host 'Done. 13 detailed SVG mobile wireframes were generated.'
Write-Host ("Output folder: " + $outDir)
