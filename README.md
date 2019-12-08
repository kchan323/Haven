# Haven
Created by: *Katelin Chan (iOS), Anika Talwar (iOS), Yanlam Ko (Backend), Jack Thompson (Backend)* | Designed by: Yanlam Ko

Living a semester abroad or graduating early? Planning to spend a summer in Ithaca and struggling to find a place to live? Using Haven will avoid the hassle of posting to or aimlessly searching on multiple platforms, making the process seamless for both parties! 

Haven is a centralized platform to help students find and post their sublets. 

The user enters their name on the login screen and presses continue, after which the user is guided to a view of all sublet listings. Here, one can search for any listing, view the sublet ad, title, location, and price, and when a listing is clicked, more detail is presented about the sublet with its description/details. Haven also provides a screen to view a collection of listings posted specific to a year and semester. Clicking on any one of the listings within the collection allows the user to see more detail about that listings and selecting to view all the listings lays them out  for that particular year/semester. The user can also see their profile of listings and drafts as well as post a listing by choosing to add a sublet, upon which they have to fill out a form with their apartment details. Their post is added under their listings  once they click the post button, but if they fill out information and aren’t quite ready to post, their listing is added as a draft on their profile. 

For best visual results, run with an iPhone 11 (or better) simulator.

See backend repo [here](https://github.com/YKo20010/haven).
See backend spec with [Dropbox](https://paper.dropbox.com/doc/Haven-Backend-API-WIP--Ap~_M5FNn_hdIArbDOHjuTmJAQ-bpk7vUlUZVoWzgrtHKBlf).

**Login Screen**
<p float="left">
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Login1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Login2.png" width = '200'/>
</p>

**Search and DetailView Screens**
<p float="left">
    <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/PullToRefresh.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/SearchLoad.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Searches.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Search1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Search2.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/DetailSearch1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/DetailSearch2.png" width = '200'/>
</p>

**Save, ViewAll, and DetailView Screens**
<p float="left">
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Saves.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/ViewAll1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/ViewAll2.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Detail1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Detail2.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Detail3.png" width = '200'/>
</p>

**Profile and DetailView Screens**
<p float="left">
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Profile.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/DetailProfile.png" width = '200'/>
</p>

**AddSublet Screen**
<p float="left">
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Post1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Post2.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Post3.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Post4.png" width = '200'/>
</p>

**ChooseImage Screen**
<p float="left">
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Photo1.png" width = '200'/>
  <img src="https://raw.githubusercontent.com/kchan323/Haven/master/Screenshots/Photo2.png" width = '200'/>
</p>

### iOS
- **NSLayoutConstraint:** used to place views as per the design and fit multiple screen dimensions.
- **UITableView:** implemented in SearchView, ProfileView, and ViewAllController to display drafts and listings with images, addresses, titles, and prices.
- **UICollectionView:** implemented in SaveView to display listings with images, prices, and titles.
- **UITabBarController:** displayed at bottom of main ViewControllers with icons for each screen, and ability to navigate between screens. User is brought to their desired page upon click of an icon.
- **API:** Users API (http://35.245.152.242/api/users/) and Listings API (http://35.245.152.242/api/listings/), created by Yanlam Ko and Jack Thompson (backend)

### Backend
&#10141; [SQLAlchemy](https://www.sqlalchemy.org/) - The ORM used

&#10141; [Flask](http://flask.pocoo.org/) - Web framework

&#10141; [Docker](https://www.docker.com/) - Containerization

&#10141; [Google Cloud](https://cloud.google.com/) - Server hosting

#### Authors:
&#10141; [Katelin Chan](https://github.com/kchan323)

&#10141; [Anika Talwar](https://github.com/atalwar98)

&#10141; [Yanlam Ko](https://github.com/YKo20010)

&#10141; [Jack Thompson](https://github.com/jackthmp)
