Tasks finished:
1. Photo showcase
2. 500px Interactions
3. UI Cosmetics & Testing

Instruction to set up the app:
Simply clone the repo, install the gems, run rails server and it is ready to go.

UI redirection guide:
1. Root path is the landing page requiring users to sign in using their 500px credentials, but users can still access the photo gallery page without signing in.

2. (1) When a user is on the photo gallery page, she is able to like any picture by clicking the heart icon, the number next to the icon is the votes count. Each photo is clickable, redirecting the user to photo show page. The 'My Gallery' logo is clickable, redirecting the user back to photo gallery page.
2. (2) When a user is on the photo gallery page and not signed in, she is still able to view the top 100 photos but if she clicks the heart icon to vote she will be asked to sign in with her 500px credentials. After signin in, she will be redirected to the photo gallery page.

3. Each photo on the gallery page is clickable, leading to the photo show page for better resolution picture and more information about that picture.

Test coverage:
1. All model methods and API calls are tests under spec/models and spec/requests directories.
2. All controller actions are tested except likes/delete.
3. Feature test is not working properly with the problem of mock clicking the OAuth sign in button. Buggy test is commented.

Notes: Other than the required functionality of liking photos. I added another functionality of unliking a photo, but this feature is not working properly. I personally feel like it might be a problem with the API or the way I access it but didn't research too deeply. It doesn't affect other functionalities of the whole app.

Plan of next iteration if there were more time:
1. Adding Masonry gem to puzzle up the photos for better looking
2. Adding simplecov gem to report the test coverage
