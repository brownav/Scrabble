# Scrabble

## At a Glance

- Practice TDD and organizing complex code by building some of the logic for a Scrabble game
- [Stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md) pair project
- Due end of class, Fri Feb 23

## Introduction

Our project manager just informed us of our next large project: we need to make the foundation code for a game of Scrabble.

Use __Test Driven Development (TDD)__ to create a collection of Ruby classes that would provide the foundation for creating a Scrabble game.  **In this project we will NOT create a full Scrabble game.** Another team of developers will create the program that runs a Scrabble game and finish the game logic.

### Learning Goals
- Use __Test Driven Development (TDD)__ to write tests and code in parallel
- Create class methods according to requirements
- Utilize [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle) to reduce code dependencies
- Utilize composition between classes

## Getting Started

From the project root, you should be able to execute all of your specs by running `rake`. Each Ruby class should be in its own file in `lib/`, and the entire project should be in a `module` called `Scrabble`. You will need to use `require_relative` to tell Ruby how to work with classes in multiple files.

### Tests
We will use [minitest](https://github.com/seattlerb/minitest) for this project. This is the same test framework that we've used for your previous project. Your spec descriptions should be meaningful and organized into `describe` blocks that reflect your intent on how to use the code.

We have provided you with a `Rakefile` and some spec files to get you started.

Do not move onto a new tier of requirements until the minimum requirements of the previous tier are complete and your specs are green across the board. Use __TDD__ to drive your development and document your edge cases.

### Driver Code
We have provided some driver code for your Scrabble game in the files `wave-1-game.rb`, `wave-2-game.rb`, and `wave-3-game.rb`. Running `$ ruby wave-1-game.rb` will begin a command-line game that uses your Scrabble code. The boilerplate code will break the first time you run it: working through the waves specified below should create a running version of the game. **Implementing code to make this game run is not a substitute for TDD or writing tests**. It is simply there for you and your pair to reference how the Game may run during each wave, to have better perspective of what your program can do, and to get some practice reading other peoples' code. We fully expect you to create the specified classes below strictly through TDD.

### Pair Programming
Utilize good pair programming practices. Refer to articles from the [Agile Alliance](http://guide.agilealliance.org/guide/pairing.html) and the [Agile Institute](http://powersoftwo.agileinstitute.com/2015/02/benefits-of-pair-programming-revisited.html) if you need a refresher for some best practices. Switch _driver_ and _navigator_ roles often. When there is uncertainty or confusion, step away from the keyboard and discuss, plan, and document on paper or whiteboard before continuing.

## Baseline
### Setup
1. You'll be working with an assigned pair. High-five your pair.
1. Choose **one person** to fork the project repo.
1. Add the other person in the pair (who didn't fork) to the forked repo as a _collaborator_. Instructions [here](https://help.github.com/articles/inviting-collaborators-to-a-personal-repository/).
1. Both individuals will clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. Both individuals `cd` into the dir created.
<!-- 1. Both individuals install needed tools via Terminal: `$ gem install simplecov` -->

### Requirements
#### Pair Plan
First, come up with a "plan of action" for how you want to work as a pair. Discuss your learning style, how you prefer to receive feedback, and one team communication skill you want to improve with this experience. Second, review the requirements for Wave 1 and come up with a "plan of action" for your implementation.

#### Implementation
- Read through the file `lib/scoring.rb`. Inside this file, you should find:
    - A `Scrabble` module
    - A `Scrabble::Scoring` **class**
- Add some sort of data structure to `Scrabble::Scoring` to store the **individual letter scores** listed below
- Read through the spec file `specs/scoring_spec.rb`, which corresponds to your `Scrabble::Scoring` class. This file has some tests pre-written and some test stubs that you will need to fill in.
- Be able to execute the tests using `rake` from the project root.

#### Score chart
|Letter                        | Value|
|:----------------------------:|:----:|
|A, E, I, O, U, L, N, R, S, T  |   1  |
|D, G                          |   2  |
|B, C, M, P                    |   3  |
|F, H, V, W, Y                 |   4  |
|K                             |   5  |
|J, X                          |   8  |
|Q, Z                          |   10 |

## Wave 1
### Primary Requirements
For wave 1 you are given some scaffolding: tests and test stubs in `specs/scoring_spec.rb`, and method stubs in `lib/scoring.rb`.

Complete the `Scrabble::Scoring` class with __full unit testing/specs__. All provided tests should pass, and all stubbed tests should be fully implemented (and pass). The class should have the following **class methods**:

- `self.score(word)`: returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
    - A seven letter word means that a player used all the tiles. Seven letter words receive a __50__ point bonus.
    - Tests for `Scoring.score` are _already written_. Your job is to write code to make them pass.
- `self.highest_score_from(array_of_words)`: returns **the word in the array with the highest score**. In the case of tie, use these tie-breaking rules:
    - It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
    - There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    - If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
    - Tests for this logic are _stubbed_, meaning the test has a name but no code written. You will have to implement them as you work on this method.

<!-- ## Wave 2
### Primary Requirements
For waves 2 and 3, you are given no starter code. You and your pair will have to create all files and classes and write all the tests yourselves.

Create a `Scrabble::Player` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic.

The constructor for `Scrabble::Player` should take exactly one argument: the player's `name`. Instances of the class should respond to the following messages:

- `#name`: returns the value of the `@name` instance variable
- `#plays`: returns an Array of the words played by the player
- `#play(word)`: Adds the input word to the `plays` Array
    - Returns `false` if player has already won
    - Otherwise returns the score of the `word`
- `#total_score`: Returns the sum of scores of played words
- `#won?`:  If the player has over 100 points, returns `true`, otherwise returns `false`
- `#highest_scoring_word`: Returns the highest scoring played word
- `#highest_word_score`: Returns the `highest_scoring_word` score

For example,

```ruby
player = Scrabble::Player.new("Ada")
player.name           # => "Ada"
player.play('cat')    # => 5
player.play('lizard') # => 16
puts player.highest_scoring_word
# prints out "lizard"
```

## Wave 3
### Primary Requirements
#### `TileBag`
Create a `Scrabble::TileBag` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic. It should have the following class and instance methods:

- `#initialize` Should set up the instance with a collection of all default tiles
- `#draw_tiles(num)` returns a collection of random tiles, removes the tiles from the default set
- `#tiles_remaining` returns the number of tiles remaining in the bag

##### Initial Distribution of Letters
| Letter : Qty. | Letter : Qty. |
|:------:|:-----:|
| A : 9  | N : 6 |
| B : 2  | O : 8 |
| C : 2  | P : 2 |
| D : 4  | Q : 1 |
| E : 12 | R : 6 |
| F : 2  | S : 4 |
| G : 3  | T : 6 |
| H : 2  | U : 4 |
| I : 9  | V : 2 |
| J : 1  | W : 2 |
| K : 1  | X : 1 |
| L : 4  | Y : 2 |
| M : 2  | Z : 1 |

#### Modifications to `Player`
Create specs for and add to the `Player` class the following instance methods:

- `#tiles` a collection of letters that the player can play (max 7)
- `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
    - It is not in the primary requirements to modify the existing `#play(word)` to use `#tiles` or check against the player's tiles

### Optional Enhancements
These need to be tested too!
- Modify in `Player` the `#play(word)` method to only allow the player to play words using letters that the player has tiles for.
- Create a `Scrabble::Dictionary` class that includes a method (class or instance) for searching a list of words to determine if a given word is valid (__must have tests__).
- Create a `Scrabble::Board` class (__must have tests__) that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction (up/down or left/right).
-->

## What Instructors Are Looking For
Check out the [feedback template](feedback.md) which lists the items instructors will be looking for as they evaluate your project.
