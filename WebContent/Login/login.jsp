<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
  <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
  <div id="background-image"></div>
  <div id="background-pattern"></div>
  <div id="login-from-container">
    <div class="card" style="width: 400px;">

      <div class="card-image">
        <figure class="image is-align-self-auto">
          <img src="./psg-logo.jpg" alt="Placeholder image">
        </figure>
      </div>

      <form class="formularioLogin" id="formularioLogin" method="post" action="LoginS">

        <div class="card-content has-background-grey-lighter">
          <div class="media">
            <div class="is-size-4 has-text-centered"><strong>Login</strong></div>
          </div>

          <div class="content">
            <div class="field">
              <p class="control has-icons-left has-icons-right">
                <input class="input" type="text" placeholder="User" id="txtUser" required="required" name="txtUser">
                <span class="icon is-small is-left">
                  <span class="material-icons">account_box</span>
                </span>
                <span class="icon is-small is-right">
                  <i class="fas fa-check"></i>
                </span>
              </p>
            </div>

            <div class="field">
              <p class="control has-icons-left">
                <input class="input" type="password" placeholder="Password" id="txtPw" required="required" name="txtPw">
                <span class="icon is-small is-left">
                  <span class="material-icons">
                    lock
                  </span>
                </span>
              </p>
            </div>

            <div class="field">
              <p class="control">
                <button class="button is-fullwidth is-success">
                  Log In
                </button>
              </p>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</body>

</html>