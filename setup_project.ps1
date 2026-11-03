$root = Get-Location

# Project Overview
@'
# MindMate AI
## Your Emotion-Aware AI Study Companion

Module: Human Computer Interaction
Assignment: Assignment 01 - New Product Experience Design
Product Type: AI-Based Mobile Application

## Project Overview

MindMate AI is a proposed AI-powered study assistant
designed to improve the learning experience of university students.

The application uses voluntarily provided mood feedback,
learning preferences and study progress to provide
personalized study recommendations.

## Main Goal

To create a user-friendly and personalized study
experience for university students.

## Main Features

1. Student Registration and Login
2. Mood Selection
3. AI Study Recommendations
4. Personalized Study Planner
5. Interactive Quizzes
6. Learning Assistance
7. Progress Tracking
8. Study Reminders
9. Personalized Learning Activities
10. Student Profile Management

## Platform

Mobile Application

## Target Users

- University Students
- Undergraduate Students
- Students who need personalized study planning
- Students who prefer interactive learning

Note: These are proposed user groups. Actual research
will be conducted to validate their needs.
'@ | Set-Content "$root\01_Project_Definition\Project_Overview.md"

# Problem Statement
@'
# Problem Statement

Many university students experience difficulties when
organizing their studies due to different learning
preferences, lack of motivation and study-related pressure.

Traditional study planning applications mainly focus on
schedules, reminders and task management.

They may not sufficiently consider students' individual
study preferences and voluntarily provided emotional feedback.

Therefore, MindMate AI is proposed as an emotion-aware
AI study assistant that provides personalized study
recommendations and learning activities.

# Proposed Solution

MindMate AI will provide:

- Mood-based study suggestions
- Personalized study plans
- Interactive quizzes
- Learning assistance
- Progress tracking
- Study reminders

The application is an educational support tool and
does not diagnose mental health conditions.
'@ | Set-Content "$root\01_Project_Definition\Problem_Statement.md"

# Objectives
@'
# Project Objectives

## Main Objective

To design an interactive AI-based study assistant
that supports personalized university learning experiences.

## Specific Objectives

1. Understand the study-related challenges of university students.
2. Identify user needs through genuine user research.
3. Design a simple and user-friendly interface.
4. Provide personalized study recommendations.
5. Support students through interactive learning activities.
6. Develop an interactive Figma prototype.
7. Evaluate usability through user testing.
'@ | Set-Content "$root\01_Project_Definition\Project_Objectives.md"

# Scope
@'
# Project Scope

## Included Features

- User registration and login
- Student onboarding
- Mood feedback selection
- Personalized study recommendations
- Study planner
- Interactive quizzes
- Study progress dashboard
- Profile management

## Outside Initial Scope

- Medical or psychological diagnosis
- Emergency mental health services
- Guaranteed improvement in academic results

## Proposed Platform

Mobile application.

## Prototype Scope

An interactive Figma prototype demonstrating
the main student journey.
'@ | Set-Content "$root\01_Project_Definition\Project_Scope.md"

# Research Questionnaire
@'
# MindMate AI - User Research Questionnaire

Purpose:
To understand university students' study habits,
challenges and preferences.

Participation is voluntary. Do not collect unnecessary
personal or sensitive information.

## Questions

1. What is your current education level?
   - Undergraduate
   - Postgraduate
   - Other

2. How often do you create a study plan?
   - Daily
   - Weekly
   - Sometimes
   - Never

3. What is your biggest study-related challenge?
   - Time management
   - Lack of motivation
   - Understanding difficult subjects
   - Concentration
   - Organizing study materials
   - Other

4. Do you currently use study planning applications?
   - Yes
   - No

5. What tools do you currently use for studying?
   - Mobile applications
   - Websites
   - Notes
   - Videos
   - Other

6. Would personalized study recommendations be useful?
   - Yes
   - No
   - Maybe

7. Would you like to select your current study mood?
   - Yes
   - No
   - Not sure

8. Which features would be most useful?
   - Personalized study plans
   - Interactive quizzes
   - AI learning assistance
   - Progress tracking
   - Study reminders

9. What type of learning activity do you prefer?
   - Reading
   - Videos
   - Quizzes
   - Practical activities
   - Combination

10. What improvements would you like in a study assistant?
    - Open-ended answer

IMPORTANT:
Collect actual responses from participants.
Do not create fictional survey results.
'@ | Set-Content "$root\02_User_Research\Research_Questionnaire.md"

# Interview Questions
@'
# User Interview Guide

1. How do you normally organize your studies?
2. What problems do you experience during studying?
3. What makes studying difficult for you?
4. How do you decide what subject to study first?
5. What applications do you currently use?
6. What features would help you study better?
7. Would you use an application that suggests
   study activities based on your feedback?
8. What would make such an application easy to use?

Record genuine responses with participant permission.
Do not include private identifying information.
'@ | Set-Content "$root\02_User_Research\Interview_Guide.md"

# Research Evidence Template
@'
# Research Evidence Log

| Participant ID | Method | Date | Main Finding |
|---|---|---|---|
| P01 | Interview | | |
| P02 | Interview | | |
| P03 | Interview | | |

Add only genuine findings.

# Research Summary

Total survey responses:
To be completed after data collection.

Main user problems:
To be completed after analysis.

User needs:
To be completed after analysis.

Design opportunities:
To be completed after analysis.
'@ | Set-Content "$root\02_User_Research\Research_Evidence.md"

# Team Responsibilities
@'
# Team Responsibilities

| Member | Main Responsibility |
|---|---|
| Member 01 | Project coordination |
| Member 02 | User interviews |
| Member 03 | Survey creation |
| Member 04 | Research analysis |
| Member 05 | Personas and empathy map |
| Member 06 | User journey and user flow |
| Member 07 | Sketches and wireframes |
| Member 08 | Figma UI design |
| Member 09 | Brand guidelines |
| Member 10 | Documentation and presentation |

All members should participate in project reviews,
prototype development and final presentation.

Record actual contributions.
'@ | Set-Content "$root\01_Project_Definition\Team_Responsibilities.md"

# Contribution Record
@'
# Group Contribution Record

| Member | Assigned Task | Completed Work | Evidence |
|---|---|---|---|
| Member 01 | | | |
| Member 02 | | | |
| Member 03 | | | |
| Member 04 | | | |
| Member 05 | | | |
| Member 06 | | | |
| Member 07 | | | |
| Member 08 | | | |
| Member 09 | | | |
| Member 10 | | | |
'@ | Set-Content "$root\01_Project_Definition\Contribution_Record.md"

# Project Timeline
@'
# 14-Day Project Timeline

| Day | Activity |
|---|---|
| 01 | Project definition and research preparation |
| 02 | Survey and interviews |
| 03 | Research analysis |
| 04 | Personas and empathy map |
| 05 | User journey and HMW |
| 06 | Feature prioritization and user flow |
| 07 | Sketches and wireframes |
| 08 | Brand guidelines |
| 09 | Main UI design |
| 10 | Remaining UI screens |
| 11 | Interactive prototype |
| 12 | Usability testing and improvements |
| 13 | Report and portfolio |
| 14 | Presentation and final review |

Adjust the timeline according to the actual deadline.
'@ | Set-Content "$root\01_Project_Definition\Project_Timeline.md"

Write-Host ""
Write-Host "=================================="
Write-Host " MINDMATE AI FILES CREATED!"
Write-Host "=================================="
Write-Host ""

tree /F