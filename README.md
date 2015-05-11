# inspirationals
Ruby Command Line CRUD Application---Capstone Project
## Project Vision
This will be a small command-line program that allows the user to generate an 'inspiring' quote from his/her command line, either in the style of Dr. Phil or 'Tiger Mom'.

Users will be able to add/edit/delete quotes, as well as ask for a type of inspiration they seek depending on their mood.  After choosing their inspirational figure (Dr. Phil or Tiger Mom) and the mood that needs inspiration, the user is given a quote that is most fitting to their need.

## Features
### Viewing Chosen Quote  (R)
In order to receive wisdom from the chosen thought leader, I want to see the advice that was chosen. (See usage example under 'Taking the Quotes Questionnaire')
### Taking the Quotes Questionnaire 
In order to receive the appropriate wisdom for my given state, I want to take a quick survey that can accurately gauge my specific need for inspiration.

Usage Example:
> ./inspirationals
```
1. I want to be inspired by Dr. Phil.
2. I want to be inspired by Tiger Mom.
```
> 1
```
Select an inspiration that you need.
1. Comfort
2. Support
3. Security
4. A way out of a situation
5. Decision
6. Challenge
```
> 6
```
If you want more, you have to require more from yourself.
```
### Viewing All Existing Quotes (R)
In order to evaluate and manage my inventory of inspirationals, I want to see the current inventory of quotes.

Usage Example:
```
> ./inspirationals manage
```
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes 
  4. List all Tiger Mom quotes
  5. Exit
```
> 3
```
  1. You're only lonely if you're not there for you.
  2. It's hard to see your own face without a mirror.
  3. Awareness without action is worthless.
```
```

Acceptance Criteria:
* All quotes are printed out.
* Each quote is given a number, which does not correspond to its database id.

### Adding a New Quote (C)
In order to be able to enter new inspirations by our wisdom leaders, I want to add the latest and greatest quotes.

Usage Example:
> ./inspirationals manage
```
1. Add a Dr. Phil quote
2. Add a Tiger Mom quote
3. List all Dr. Phil quotes 
4. List all Tiger Mom quotes
5. Exit
```
> 2
```
Please type in your 'Tiger Mom' quote.
```
> Go practice piano.
```
Go practice piano.
Would you like to?
1. Add
2. Edit
3. Exit
```
> 1
```
Please enter the quote category for the quote you added.
```
> Encouragement
```
"Go practice piano." has been added under the category, Encouragement.
1. Add a Dr. Phil quote
2. Add a Tiger Mom quote
3. List all Dr. Phil quotes
4. List all Tiger Mom quotes
5. Exit
```

Acceptance Criteria:
* Program prints out confirmation that the quote and corresponding
  category was added.
* The new quote is added to the database.
* All references to the new quote is connected tothe database.
* After the addition, the user is taken back to the main manage menu.

### Editing an Existing Quote (U)
In order to fix any inaccuracies with the quotes, I want to edit an existing quote.

Usage Example:
> ./inspirationals manage
```
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes
  4. List all Tiger Mom quotes
  5. Exit
```
  > 4
```
  1. PhD doesn't come with professional certification.
  2. Just work harder.
  3. Would you like to become a doctor, or be homeless?
  Which inspirational would you like to access?
```
  > 2
```
  Would you like to become a doctor, or be homeless?
  Would you like to?
  1. Edit
  2. Delete
  3. Exit
```
  > 1
```
  Please edit the quote to your liking.
```
  > Become a doctor, or be homeless.
```
  "Become a doctor, or be homeless." is now edited. Is this correct?
  1. Yes
  2. No; I'd like to edit.
```
  > 1
```
  Is the category "Career Advice" correct?
  1. Yes
  2. No; I'd like to edit.
```
  > 1
```
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes
  4. List all Tiger Mom quotes
  5. Exit
```
Acceptance Criteria:
* Program prints out confirmation that the quote was edited.
* The edited quote is updated on the database.
* All references to the edited quote are updated from the database.
* After the edit confirmation, the user is taken back to the main manage menu.


### Deleting a Quote (D)
In order to remove duplicates and/or quotes that aren't illuminating, I want to delete an existing quote.

Usage Example:
> ./inspirationals manage
```
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes
  4. List all Tiger Mom quotes
  5. Exit
```
  > 3
```
  1. You're only lonely if you're not there for you.
  2. It's hard to see your own face without a mirror.
  3. Awareness without action is worthless.
  Which inspirational would you like to access?
```
  > 2
```
  It's hard to see your own face without a mirror.
  Would you like to?
  1. Edit
  2. Delete
  3. Exit
```
  > 2
```
  "It's hard to see your own face without a mirror." has been deleted
  1. Add a Dr. Phil quote
  2. Add a Tiger Mom quote
  3. List all Dr. Phil quotes
  4. List all Tiger Mom quotes
  5. Exit
```

Acceptance Criteria:
* Program prints out confirmation that the quote was deleted.
* The deleted quote is removed from the database.
* All references to the deleted quote are removed from the database.
* After the deletion, the user is taken back to the main manage menu.

### Importing Baseline Quotes
In order to enter all existing quotes by the thought leaders, I want to import an existing list of quotes.
