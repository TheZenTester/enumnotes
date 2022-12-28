# Overview
TJ Null's Awesome OSCP/Network Pentest JPT File + Aesthetic Markdown = enumnotes

Tool that is a repo for my PWK/OSCP enumeration notes.  Shoutout to @tjnull for his awesome Joplin file: https://github.com/tjnull/TJ-JPT which served as the inspiration/main source of the content.This tool might be for perfect for you right out of the box. If not, it hopefully will give you a framework in which you can make it your own by forking and copypasta-ing your own commands you use most.

## Example Output
The Recon "General" output:
`enumnotes.sh recon general`
![image](https://user-images.githubusercontent.com/96437320/209210442-9b62a0aa-b364-45af-8b87-6f3cbecd5d4e.png)

Paginated output:
`enumnotes.sh exp msfvenom -p`
![image](https://user-images.githubusercontent.com/96437320/209210782-105710d3-3b83-4616-8115-857b7355074d.png)

For comparison, Joplin output:
![image](https://user-images.githubusercontent.com/96437320/209211427-69142998-0bef-440c-9878-f9228fc4c430.png)



## Advantages
- The 0daysecurity post was translated from the wayback machine into markdown
- No need to install/use Joplin to view content
- Easy ability to customize/change enumeration notes (simple as editing a text file, or adding a file to the directory and `glow` line)
- Colored output makes it easy to read
- Output straight to command line or ability to paginate output
- Files are easily editable/stored as markdown files vs. sqlilite database (joplin)

## Prerequisites
The `setup.sh` script handles all prereqs.
- Glow
    - Glow requires `snap` to install as well. 

# Setup

```bash
git clone https://github.com/TheZenTester/enumnotes.git
cd enumnotes
chmod 754 setup.sh
./setup.sh
```

# Syntax
`enumnotes category sub-category [glow-flags]`

# Requirements
- glow: https://github.com/charmbracelet/glow

# Enhancements
- Search feature to look through notes and display list of files with search criteria (i.e. `netexp search impacket`)

# Enjoy
Make the files your own! add/remove sections, can also even add files to the directories within and update the `enumnotes.sh` script to print in the glow command
