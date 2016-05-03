# The Softer Side of the CIA #

The [CIA World Factbook](https://www.cia.gov/library/publications/resources/the-world-factbook/ "CIA World Factbook") is a surprisingly thorough compendium of data about the countries of the world, continually updated. There's no API, but there's a clunky Ruby Gem (called factbook) which I used to scrape it & turn it into a big JSON file.

Let's parse it to within an inch of its life!

### Introduction ###
1. `sudo gem install json`
2. Also install the Chrome extension JSONViewer. This will allow you to open up the big.json file in a tab and see its structure.
3. Starter file: cia.rb

### Part 1 : List the countries ###
We're gonna do these in Ruby. Write a method that lists all the countries in alphabetical order.

### Part 2 : Just the Stans ###
Now write a method that lists all the countries whose name ends in '-stan'.

![CIA](https://pbs.twimg.com/profile_images/3368427308/08273ff3c0ce8ff1506c91e237c05d7f.jpeg)

### BONUS 1 : A report for FAO ###
Write a method that lists top ten countries by percentage of arable land.

### BONUS 2 : Almanac ###
Write a method that accepts user input in the form of simple questions and spits out the answers.
* Example: 'How big is Tunisia?' =>  'Tunisia is slightly larger than Georgia.'

---
