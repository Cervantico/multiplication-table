using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MultiplicationTable
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] bases = { "decimal", "binary", "hexadecimal" };
            int matrix_size = 10;

            // reads querystring input and validates int
            bool result = int.TryParse(Request.QueryString["matrix_size"], out matrix_size);

            // checks lower and upper limit 
            matrix_size = matrix_size < 3 ? 3 : matrix_size;
            matrix_size = matrix_size > 15 ? 15 : matrix_size;


            // reads querystring input, default is decimal
            string matrix_base = Request.QueryString["matrix_base"] != null ? Request.QueryString["matrix_base"] : "decimal";

            // validates value
            matrix_base = bases.Any(matrix_base.Contains) ? matrix_base : "decimal";

            _base.Text = matrix_base;
            _size.Text = matrix_size.ToString();

        }
    }
}