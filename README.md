[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/austinandrade/sweater-weather-be">
    <img src="docs/sweater_weather_logo.png" alt="Logo" width="500" height="338">
  </a>
  
<!-- ABOUT THE PROJECT -->
## About The Project

*TO DO:* PLACE DESCRIPTION HERE


### Built With

* [RubyOnRails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Travis](https://www.travis-ci.com/)
* [Figaro](https://github.com/laserlemon/figaro)
* [Fast Json API](https://github.com/Netflix/fast_jsonapi)

* [RSpec](https://rspec.info/)
* [Simplecov](https://github.com/simplecov-ruby/simplecov)
* [Rubocop](https://github.com/rubocop/rubocop)
* [Webmock](https://github.com/bblimke/webmock)
* [VCR](https://github.com/vcr/vcr)


### Prerequisites 
  
  This application is dependent on having [Ruby](https://www.ruby-lang.org/en/), [RubyOnRails](https://rubyonrails.org/), and [PostgreSQL](https://www.postgresql.org/) installed.
  See [this](https://www.youtube.com/watch?v=Qn-1egqgsnM) video for a detailed guide on setup of your local environment and all dependencies.
  
### Installation

1. Fork the repo
2. Clone the repo
   ```sh
   git clone git@github.com:your-username/sweater-weather-be.git
   ```
3. Install dependencies
   ```sh
   bundle install
   ```
4. Create PostgreSQL database
   ```sh
   rake db:{drop,create,migrate,seed}
   ```
5. Register for [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/) and [OpenWeather](https://openweathermap.org/api/one-call-api) API keys
  
6. Create an application.yml file
   ```sh
   touch config/application.yml
   ```
7. Paste your MapQuest and OpenWeather API keys as pictured
  *TO DO:* ADD SCREENSHOTS HERE
  
8. Initialize rails server
   ```sh
   rails s
   ```
  
*Utilize Postman or localhost:3000 to CRUD present PostgreSQL records:*
#### All available endpoints: 
  1. *TO DO:* PLACE ENDPOINTS HERE
  
  
<!-- USAGE EXAMPLES -->
## Learning Goals & Accomplishments

- *TO DO:* ACCOMPLISHMENTS HERE

<!-- CONTACT -->
## Contact

Email - [austinmandrade@gmail.com](austinmandrade@gmail.com)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/austinandrade/
