<%@ Page Language="C#" %>
<%@ Import Namespace="System.Activities.Statements" %>
<html>
<head>
  <title>Forms Authentication - Default Page</title>
</head>

<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
             Welcome.Text = "Hello, " + Context.User.Identity.Name;
            Login1.Visible = false;
        }
       

    }

    void Signout_Click(object sender, EventArgs e)
    {

        FormsAuthentication.SignOut();
        Response.Redirect(Request.RawUrl);
    }

    protected void LogIn(object sender, AuthenticateEventArgs e)
    {
        if ((Login1.UserName == "wojtek") &&
        (Login1.Password == "grzesiak"))
        {

            // FormsAuthentication.SetAuthCookie(UserEmail.Text,Persist.Checked);

            FormsAuthentication.RedirectFromLoginPage
            (Login1.UserName, Login1.RememberMeSet);
        }
        //else
        //{
        //    Login1.
        //    Msg.Text = "Invalid credentials. Please try again.";
        //}
    }
</script>

<body>
  <h3>
    Using Forms Authentication</h3>
  <asp:Label ID="Welcome" runat="server" />
  <form id="Form1" runat="server">
    <asp:Button ID="Submit1" OnClick="Signout_Click" 
       Text="Sign Out" runat="server" />
      <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="LogIn" style="z-index: 1; left: 4px; top: 163px; position: absolute; height: 117px; width: 197px">
          <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
          <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
          <TextBoxStyle Font-Size="0.8em" />
          <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
      </asp:Login>
  </form>
</body>
</html>