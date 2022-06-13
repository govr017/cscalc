using Newtonsoft.Json;
namespace cscalc_client
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private async void button1_Click(object sender, EventArgs e)
        {
            var url = textBox1.Text;
            using var client = new HttpClient();

            try
            {
                if (comboBox1.Text == "+")
                {
                    var response = await client.GetStringAsync(url + "api/plus?a=" + textBox2.Text + "&b=" + textBox3.Text);
                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(response);
                    label4.Text = "Result: " + decr.result;
                }
                else if (comboBox1.Text == "-")
                {
                    var response = await client.GetStringAsync(url + "api/minus?a=" + textBox2.Text + "&b=" + textBox3.Text);
                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(response);
                    label4.Text = "Result: " + decr.result;
                }
                else if (comboBox1.Text == "*")
                {
                    var response = await client.GetStringAsync(url + "api/multiply?a=" + textBox2.Text + "&b=" + textBox3.Text);
                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(response);
                    label4.Text = "Result: " + decr.result;
                }
                else if (comboBox1.Text == "/")
                {
                    var response = await client.GetStringAsync(url + "api/divide?a=" + textBox2.Text + "&b=" + textBox3.Text);
                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(response);
                    label4.Text = "Result: " + decr.result;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            




        //    if (Uri.IsWellFormedUriString(url, UriKind.Absolute))
        //    {
        //        var check_for_valid_req = await client.SendAsync(new HttpRequestMessage(HttpMethod.Head, url));
        //        if (check_for_valid_req.ReasonPhrase == "OK")
        //        {
        //            try
        //            {
        //                var response = await client.GetStringAsync(url);
        //            }
        //            catch (Exception ex)
        //            {
        //                label4.Text = ex.Message;
        //            }
        //                if (comboBox1.Text == "+")
        //                {
        //                    url = url + "api/plus?a=" + textBox2.Text + "&b=" + textBox3.Text;
        //                    var req = await client.GetStringAsync(url);
        //                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(req);
        //                    label4.ForeColor = Color.Black;
        //                    label4.Text = "Result: " + decr.result + check_for_valid_req.Headers.Server;
        //                }
        //                else if (comboBox1.Text == "-")
        //                {
        //                    url = url + "api/minus?a=" + textBox2.Text + "&b=" + textBox3.Text;
        //                    var req = await client.GetStringAsync(url);
        //                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(req);
        //                    label4.ForeColor = Color.Black;
        //                    label4.Text = "Result: " + decr.result;
        //                }
        //                else if (comboBox1.Text == "*")
        //                {
        //                    url = url + "api/multiply?a=" + textBox2.Text + "&b=" + textBox3.Text;
        //                    var req = await client.GetStringAsync(url);
        //                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(req);
        //                    label4.ForeColor = Color.Black;
        //                    label4.Text = "Result: " + decr.result;
        //                }
        //                else if (comboBox1.Text == "/")
        //                {
        //                    url = url + "api/divide?a=" + textBox2.Text + "&b=" + textBox3.Text;
        //                    var req = await client.GetStringAsync(url);
        //                    dynamic decr = JsonConvert.DeserializeObject<dynamic>(req);
        //                    label4.ForeColor = Color.Black;
        //                    label4.Text = "Result: " + decr.result;
        //                }
        //                else
        //                {
        //                    label4.ForeColor = Color.Red;
        //                    label4.Text = "Invalid Operator! -> " + comboBox1.Text;
        //                }
        //            //else
        //            //{
        //            //    label4.ForeColor = Color.Red;
        //            //    label4.Text = "Failed server check. Invalid server.";
        //            //}
        //        }
        //        else
        //        {
        //            label4.ForeColor= Color.Red;
        //            label4.Text = "Request wasn't found on the server. Did you type the URL correctly?";
        //        }
        //    }
        //    else
        //    {
        //        label4.ForeColor = Color.Red;
        //        label4.Text = url + " -> is not a url"; 
        //    }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}