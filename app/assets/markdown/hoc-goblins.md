###### Last updated: 09/15/2022

##### Lesson Plans
# Goblins 'n Glory

### Curriculum Summary
- Level: Beginner
- 3 x 45-60 minute coding sessions

# TODO: write this for new HoC activity

#### Overview
With the right environment, learning the basics of formal syntax and typing code can be fun and intuitive for students as early as 3rd grade. Instead of block-based visual programming languages that hinder a student’s proper understanding of code, CodeCombat introduces real coding from the very first level. By strengthening their typing, syntax and debugging skills, we empower students to feel capable of building real programs successfully.

_This guide is written with Python-language classrooms in mind, but can easily be adapted for JavaScript._

### Scope and Sequence

| Module                                                     |             Levels | Transfer Goals               |
| ---------------------------------------------------------- | :----------------- | :--------------------------- |
| [1. Basic Syntax](#basic-syntax)                           |                1-6 | Call methods in order, with and without arguments      |
| [2. Loops](#loops)                                         |               7-9 | Repeat code sequences       
|                                                           |
| [3. Enter the Arena](#enter-the-arena) |                 11 | Apply coding skills to compete in an AI League arena |

### Core Vocabulary

**Basic Syntax** - the basic spelling and grammar of a language, and must be carefully paid attention to in order for code to properly execute. For example, while Python and JavaScript are used to do similar things in Course 1, the syntax for them is noticeably different, because they are different programming languages.

**Object** - a character or thing that can perform actions.

**String** - a type of programming data that represents text. In both Python and JavaScript, strings are represented by text inside quotes. In Course 1, strings are used to identify objects for the hero to attack.

**Method** - an action performed by an object.

**Argument** - extra information passed into a method in order to modify what the method does. In both Python and JavaScript, arguments are represented by code that is inside the parentheses after a method. In Course 1, arguments must be used to define enemies before the hero can attack them, and can also be used to move multiple times without writing new lines of code.

**Property** - data about or belonging to an object.

**While Loop** - used to repeat actions without the player needing to write the same lines of code over and over. In Python, the code that is looped must be indented underneath the while true statement. In JavaScript, the code that is looped must be enclosed by curly brackets {}. In Course 1, while loops repeat forever, and are used to navigate mazes made up of identical paths, as well as attack objects that take a lot of hits to defeat (strong Doors, for example).

**Variable** - a symbol that represents data, and the value of the variable can change as you store new data in it. In Course 1, variables are used to first define an enemy, and then passed along as an argument to the attack method so that the hero can attack the right enemy.

##### Module 1
## Basic Syntax 
### Summary

The puzzles in these levels are framed as mazes for students to solve using Computational Thinking and computer programming. They are designed to be a gentle introduction to Python syntax through a relatable medium. 

The hero starts at a particular place and has to navigate to the goal without running into spikes or being spotted by ogres. 

Some students may want to delete their code every time and only type the next step. Explain to them that the code must contain all the instructions from start to finish, like a story: it has a beginning, a middle, and an end. Every time you click Start, the hero returns to the beginning. 

### Transfer goals

- Use Python syntax
- Call methods
- Understand that order matters

### Standards 

**CCSS.Math.Practice.MP1** Make sense of problems and persevere in solving them.
**CCSS.Math.Practice.MP6** Attend to precision.

### Instructive Activity: Basic Syntax (10 mins)

#### Explain (3 mins)

**Syntax** is how we write code. Just like spelling and grammar are important in writing prose, syntax is important when writing code. Humans are good at figuring out what something means, even if it isn’t exactly correct, but computers aren’t that smart, and they need you to write with no mistakes. 

code example: `hero.moveRight()`
vocabulary:   (object) (method)
read aloud: “hero dot move right”

**Objects** are the building blocks of Python. They are things or characters that can perform actions. Your hero is an object. It can perform the moving actions.

**Methods** are actions an object can do. `moveRight()` is a method. Method names are always followed by parentheses. The order of methods matters!

**Arguments** are ways we can customize a method. You can place a word or number inside the parentheses. For example,  `moveRight(4)` customizes the moveRight method so that the hero moves 4 times. `hero.attack("Brak")` customizes the attack method so that the hero only attacks the enemy named Brak.

#### Interact (5 mins): Recycling Robot

Practice giving written instructions using Python methods in order.

**Materials:** Desk or table, recycling bin, balls of different colored paper to recycle (blue, red, etc)

You (the teacher) are going to be the robot that the class controls using methods. The goal of this exercise is for the class to collectively write a program like this: 

``` python
teacher.pickUpBall("blue")
teacher.turnRight()
teacher.moveForward(4)
teacher.moveForward()
teacher.turnLeft()
teacher.moveForward(2)
teacher.dropBall()
```

The experience should introduce them to Python syntax (including the dot between the object and method, and the parentheses at the end) and the importance of order in a sequence of instructions. 

At the front of the class, set some scrunched up paper balls on a flat surface. Place the recycling bin a few steps away. Explain that you are a recycling robot, and the class’s job is to program you. 

The robot is a Python object. What is your name in Python? Whatever you choose, make sure it starts with a lower-case letter. Write it on the board. 

`teacher`

To make the robot perform an action, you have to call a method. Write a dot after your object name, then decide as a class what the first action should be. After the dot, write the method name followed by empty parentheses. Decide if you want to add an argument to the method as well. Off to one side, draw a “Run” button.  

`teacher.pickUpBall("blue")`

Have a volunteer press the “Run” button to run the program and test that it works. 

_It is important that you reset yourself and the paper balls every time the code is changed, and run the whole program from the beginning._

Invite students to add code to the program one at a time. If there is an error in the syntax, make a funny beeping sound and stop. Have the class work together to write and rewrite the program until you successfully get a ball in the recycling bin. 

#### Reflect (2 mins)

**Why is syntax important?** (It lets you be specific about exactly what you want to happen.)

**Does order matter?** (yes)

**Can a human understand the directions even if there’s a mistake in the syntax?** (sometimes)

**Can a computer?** (no)

### Coding Time (30-45 mins)

**First time students will need to create accounts**
For additional information on helping students create account, see our [Teacher Getting Started Guide](https://files.codecombat.com/docs/resources/TeacherGettingStartedGuide.pdf).

Allow the students to go through the game at their own pace, keeping notes about every level on paper or digital document. We recommend using following format, which you can also print out as templates: [Progress Journal [PDF]](https://files.codecombat.com/docs/resources/ProgressJournal.pdf)

```
Level #: _____  Level Name: ____________________________________
Goal: __________________________________________________________
What I did:

What I learned:

What was challenging:


```

Circulate to assist. Draw students’ attention to the instructions and tips.

If student have trouble breaking the problem down, refer to the [Engineering Cycle Worksheet [PDF]](https://files.codecombat.com/docs/resources/EngineeringCycleWorksheet.pdf) to reinforce the steps to solving each puzzle.

### Written reflection (5 mins)

Select appropriate prompt(s) for the students to respond to, referring to their notes.

**Tell me how to play CodeCombat.**

>You have to move to the gem without hitting the spikes. I learned that you have to type “hero.” then the moving code. You have to spell it right and put () at the end. But it shows you the things you can type and you can click on them instead. You click RUN to make it go. You can try as many times as you need.

**What’s the difference between an object and a method?**

>The object is the hero and she has methods that are things she can do. The object has a dot after it and the method has ().

**How can you tell when you’ve made a mistake in your code? How do you fix it?**

>Sometimes the code doesn’t won’t run because there is a mistake in it. They put a red ! next to the mistake and try to help you. You have to read the code to figure out what’s wrong.

**Why is your hero in the Kithgard Dungeon? What is your quest? Are you a good guy or a bad guy?**
_(write your own backstory)_

>I went into the Kithgard Dungeon to steal gems from the ogres. I need to get a lot of gems to pay the ransom for my village, otherwise a big bully monster will destroy it and my family will be homeless. I think I’m a good guy but the ogres probably think I’m bad because I’m stealing from them. 


##### Module 2
## Loops

### Summary

Up to now, students have had to write long sequences of actions with no shortcuts. These levels introduce loops, which allow them to achieve more with fewer lines of code. 

The puzzles in this section are harder to solve than in the first module. Encourage collaboration among your students, as they first must understand what their goal is, then devise a strategy for solving the level, then put that plan into action. 

### Transfer Goals

- Write an infinite loop
- Break a problem into smaller pieces
- Decide which parts of an action repeat

### Standards
**CCSS.Math.Practice.MP1** Make sense of problems and persevere in solving them.
**CCSS.Math.Practice.MP8** Look for and express regularity in repeated reasoning.

### Instructive Activity: Loops (10 mins)

#### Explain (3 mins)

A **loop** is a way of repeating code. One way of writing loops uses the keyword _while,_ followed by an **expression** that can be evaluated as True or False. _while_ is a special word that tells the computer to evaluate (or solve) what comes after it, and then do the actions indented underneath until the expression becomes False.

These levels in CodeCombat require an **infinite loop**, or a loop that repeats forever.  For that, we need an expression that is always true. Luckily, _True_ is a Python shortcut that always evaluates as True!

Below, `while` is the keyword, and `True` is the expression
``` python
while True: 
    hero.moveRight()  # action
    hero.moveUp()     # another action
```

You can put as many lines of code as you want inside the loop. They all have to be indented with four spaces. That’s how Python knows they’re part of the loop. Indentation is an important part of Python! Whenever you have a problem with your code, check the indentation first. 

#### Interact (5 mins)

As a class, think of as many ways as possible of writing a repeating action in English. (Use the following examples if students have a hard time thinking of their own.) 

Circle the English words that tell you it’s a loop. Rewrite these instructions using `while`. Check indentation. Label each part as keyword, expression, or action. Here are some examples to get you started:

Keep walking **until** you get to the door. _While you are not at the door, keep walking._
``` python
while door = 0: 
    walk()
```

Bounce the ball five **times**. _While bounces are less than 5, bounce the ball._

``` python
while bounces < 5 : 
    ball.bounce()
```

Put away **every** toy. _While there are still toys out, put a toy away._

``` python
while toys > 0: 
    putAway(toy)
```

Have students take turns writing, checking, and labelling the code until it becomes easy. 

#### Reflect (2 mins)

**What is a loop?** (a way of repeating actions)

**What is an expression?** (something that is True or False, usually using =, <, or >)

**How do you write a loop that never ends?** (Use `while True`)

### Coding Time (30-45 mins)

Allow the students to go through the game at their own pace, keeping notes about every level on paper or digital document. We recommend using following format, which you can also print out as templates: [Progress Journal [PDF]](https://files.codecombat.com/docs/resources/ProgressJournal.pdf)

```
Level #: _____  Level Name: ____________________________________
Goal: __________________________________________________________
What I did:

What I learned:

What was challenging:


```

Circulate to assist. Draw students’ attention to the instructions and tips.

Focus on debugging, employing appropriate strategies for getting yourself unstuck. Use your class/school’s growth mindset guidelines, use the [Engineering Cycle Worksheet [PDF]](https://files.codecombat.com/docs/resources/EngineeringCycleWorksheet.pdf) as an unblocking tool, or ask them to follow this list:

1. Read the comments line by line
2. Read your code line by line
3. Read the hints
4. Explain the problem you’re having to a neighbor
5. Press the reload button and try again
6. Ask the teacher

### Written Reflection (5 mins)

**Tell me how you used a shortcut to save time and effort.**

>I used while True to make my code repeat forever. I had to remember to put four spaces on each line. It’s good because you don’t have to type all the code. 

**What are the things you have to remember to write an infinite loop?**

>You have to type while True, and remember to put a : after it. On the next line, put four spaces before your code. If you want more than one line to repeat, they all have to have four spaces. 

**Can you give me tips about solving these kinds of levels? Give an example.**
>You have to see what are the things that repeat. Sometimes it is just one thing, and sometimes it is lots of things. For example, in the Haunted Kithmaze you go to a dead end if you just put moveRight() in the loop because it just goes right, right, right forever. You also have to do moveUp() so it goes right, up, right, up. 

##### Module 3
## Enter the Arena
### Summary 

The arena level is a reward for completing the required work. Students who have fallen behind in the levels or who have not completed their written reflections should use this time to finish. As students turn in their work, they can enter the AI League arena and attempt multiple solutions until time is called. 

See the [AI League Educators Getting Started Guide](https://docs.google.com/presentation/d/1ouDOu2k-pOxkWswUKuik7CbrUCkYXF7N_jNjGO0II6o/edit?usp=sharing) for more details.

### Transfer Goals
- Write accurate Python syntax
- Debug Python programs
- Refine solutions based on observations

### Standards
**CCSS.Math.Practice.MP1** Make sense of problems and persevere in solving them.
**CCSS.Math.Practice.MP2** Reason abstractly and quantitatively.
**CCSS.Math.Practice.MP6** Attend to precision.

### Coding Time (40-55 mins)

Have students navigate to the last level, **Magma Mountain**, and complete it at their own pace. 

#### Rankings**

In the warm up round, students will only compete against the computer. Once students beat the default computer they can create an account to compete with other coders around the world. You can learn about the CodeCombat AI League [here](https://codecombat.com/league).

If some students are intimidated by competition or being publicly ranked, give them the option of a writing exercise instead: 

- Write a walkthrough or guide to your favorite level
- Write a review of the game
- Design a new level

#### Refining the Code

Code for the arena can be submitted more than once. Encourage your students to submit code, observe how it fares against the computer or other competitors, and then make improvements and resubmit.

### Reflect (5 mins)

**Class discussion: How is coding a solution different from controlling a hero in real time?**

You have been playing a game that requires you to think about a whole plan in advance, then let the hero carry out your instructions without intervention. This differs dramatically from the traditional way of playing video games by directly controlling the hero and making decisions while the game is running. Talk about how these differences feel. Which is more fun? Which is harder? How does your strategy change? How do you deal with mistakes? 
