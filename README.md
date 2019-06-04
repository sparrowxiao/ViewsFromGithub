# ViewsFromGithub
To create a project of calling a RESTful API and using other essential skills for iOS development

Day1:
- [x] Made a most regular http connection worked
I'd like to read proofed the documentation, so Foundation owns the basic swift API to make http request
https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory

I named a function getHTMLContent()

Day2:
- [ ] Github REST API 
So far the latest Github REST API version is here[https://developer.github.com/v3/]
Sometimes I  check the traffic of my public repos, as we know, if you want to check the numbers of views from website, you have to click the repo > insights > Traffic, too many clicks. To me, yes if I want to check it everyday.

Here, we can have the easy way to do it 
https://developer.github.com/v3/repos/traffic/#views
I'd like to test the command line in Terminal to see the right responsed data format.
```
curl -i -H "Authorization: token xxx_your_token_created_in_github" https://api.github.com/repos/sparrowxiao/HTML-Email-Template/traffic/views
```



Todo:
- [ ] Error Handling
- [ ] Unit Test
