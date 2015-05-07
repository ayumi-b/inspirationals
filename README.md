# inspirationals
Ruby Command Line Capstone Project

## Project Vision

This will be a small command-line program that allows the user to generate an 'inspiring' quote from his/her command line, either in the style of Dr. Phil or 'Tiger Mom'.

Users will be able to add/edit/delete quotes, as well as ask for a type of inspiration they seek depending on their mood.  After choosing their inspirational figure (Dr. Phil or Tiger Mom) and the mood that needs inspiration, the user is given a quote that is most fitting to their need.

## Features

### Viewing Chosen Quote  (R)

In order to receive wisdom from the chosen thought leader, I want to see the advice that was chosen.

### Taking the Quotes Questionnaire  

In order to receive the appropriate wisdom for my given state, I want to take a quick survey that can accurately gauge my specific need for inspiration.


### Viewing All Existing Quotes

In order to evaluate and manage my inventory of inspirationals, I want to see the current inventory of quotes.
Usage Example:
  > ./inspirationals manage
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes 
  4. List all Tiger Mom quotes
  5. Exit
  > 3
  1. You're only lonely if you're not there for you.
  2. It's hard to see your own face without a mirror.
  3. Awareness without action is worthless.

### Adding a New Quote

In order to be able to enter new inspirations by our wisdom leaders, I want to add the latest and greatest quotes.

Usage Example:
  > ./inspirationals manage
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes 
  4. List all Tiger Mom quotes
  5. Exit
  > 2
  Please type in your 'Tiger Mom' quote.
  > Go practice piano.
  Go practice piano.
  Would you like to?
  1. Add
  2. Edit
  3. Exit
  > 1
  "Go practice piano." has been added.
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes 
  4. List all Tiger Mom quotes
  5. Exit

### Editing an Existing Quote

In order to fix any inaccuracies with the quotes, I want to edit an existing quote.

### Deleting a Quote

In order to remove duplicates and/or quotes that aren't illuminating, I want to delete an existing quote.

Usage Example:
  > ./inspirationals manage
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes 
  4. List all Tiger Mom quotes
  5. Exit
  > 3
  1. You're only lonely if you're not there for you.
  2. It's hard to see your own face without a mirror.
  3. Awareness without action is worthless.
  > 2
  It's hard to see your own face without a mirror.
  Would you like to?
  1. Edit
  2. Delete
  3. Exit
  > 2
  "It's hard to see your own face without a mirror." has been deleted
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes 
  4. List all Tiger Mom quotes
  5. Exit


Acceptance Criteria:

### Importing Baseline Quotes

In order to enter all existing quotes by the thought leaders, I want to import an existing list of quotes.
