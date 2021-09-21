function fn() {
     var env = karate.env; // get system property 'karate.env'
     var data = karate.read('classpath:env.json');
     var baseUrl = data.baseUrl;
     var okPassword = data.okPassword;
     var emptyPassword = data.emptyPassword;
     var wrongPassword = data.wrongPassword;
     var okEmail = data.okEmail;
     var emptyEmail = data.emptyEmail;
     var wrongEmail = data.wrongEmail;

  var config = {
    baseUrl: baseUrl,
    okPassword: okPassword,
    emptyPassword: emptyPassword,
    wrongPassword:  wrongPassword,
    okEmail: okEmail,
    emptyEmail: emptyEmail,
    wrongEmail: wrongEmail,
    env: env,
  }
  return config;
}