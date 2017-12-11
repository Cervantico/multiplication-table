using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MultiplicationTable
{
    public partial class index : System.Web.UI.Page
    {
        private int matrix_size;
        private string matrix_base;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                readParameters();
                buildMatrix();
            }
        }

        private void readParameters()
        {
            string[] bases = { "decimal", "binary", "hexadecimal" };

            // reads querystring input and validates int
            bool result = int.TryParse(Request.QueryString["matrix_size"], out matrix_size);

            if (result)
            {
                // checks lower and upper limit 
                matrix_size = matrix_size < 3 ? 3 : matrix_size;
                matrix_size = matrix_size > 15 ? 15 : matrix_size;
            }
            else
                matrix_size = 10;

            // reads querystring input, default is decimal
            matrix_base = Request.QueryString["matrix_base"] != null ? Request.QueryString["matrix_base"] : "decimal";

            // validates value
            matrix_base = bases.Any(matrix_base.Contains) ? matrix_base : "decimal";

            form_matrix_base.SelectedValue = matrix_base;
            form_matrix_size.SelectedValue = matrix_size.ToString();

        }

        private void getParameters()
        {
            matrix_size = Int32.Parse(form_matrix_size.SelectedValue);
            matrix_base = form_matrix_base.SelectedValue;

        }

        protected void generate_Click(object sender, EventArgs e)
        {
            getParameters();
            buildMatrix();
        }

        private void buildMatrix()
        {
            Matrix_cell matrix_cell;

            // build header
            TableRow new_Row = new TableRow();
            the_matrix.Rows.Add(new_Row);

            TableCell new_Cell = new TableCell();

            // corner cell is empty
            new_Cell.CssClass = "alert alert-primary";
            new_Cell.Text = String.Empty;

            new_Row.Cells.Add(new_Cell);
            // --
            
            for (int columnCounter = 1; columnCounter <= matrix_size; columnCounter++)
            {
                new_Cell = new TableCell();

                new_Cell.CssClass = "alert alert-primary";

                matrix_cell = new Matrix_cell(matrix_base, 1, columnCounter, true);
                new_Cell.Text = matrix_cell.cell_text;

                new_Row.Cells.Add(new_Cell);
            }

            // build rows
            for (int rowCounter = 1; rowCounter <= matrix_size; rowCounter++)
            {
                new_Row = new TableRow();
                the_matrix.Rows.Add(new_Row);

                // first cell is a "header"
                new_Cell = new TableCell();

                new_Cell.CssClass = "alert alert-primary";

                matrix_cell = new Matrix_cell(matrix_base, rowCounter, 1, true);
                new_Cell.Text = matrix_cell.cell_text;

                new_Row.Cells.Add(new_Cell);
                // --

                for (int columnCounter = 1; columnCounter <= matrix_size; columnCounter++)
                {
                    new_Cell = new TableCell();

                    matrix_cell = new Matrix_cell(matrix_base, rowCounter, columnCounter, false);

                    new_Cell.Text = matrix_cell.cell_text;
                    new_Cell.ToolTip = matrix_cell.tooltip;

                    if (rowCounter == columnCounter)
                        new_Cell.CssClass = "alert alert-success";
                    else
                        new_Cell.CssClass = "alert alert-light";

                    new_Row.Cells.Add(new_Cell);
                }
            }
        }
    }


    public class Matrix_cell
    {
        public string tooltip;
        public string cell_text;

        public Matrix_cell()
        {
        }

        public Matrix_cell(string _matrix_base, int _row_value, int _column_value, bool header)
        {
            int result = _row_value * _column_value;

            switch(_matrix_base)
            {
                case "decimal":

                    if(!header)
                        this.tooltip = _row_value.ToString() + "x" + _column_value.ToString() + " = " + result.ToString();
                    this.cell_text = result.ToString();

                    break;

                case "binary":

                    if (!header)
                        this.tooltip = Convert.ToString(_row_value, 2) + " x " + Convert.ToString(_column_value, 2) + " = " + Convert.ToString(result, 2);
                    this.cell_text = Convert.ToString(result, 2);

                    break;

                case "hexadecimal":

                    if (!header)
                        this.tooltip = _row_value.ToString("X") + " x " + _column_value.ToString("X") + " = " + result.ToString("X");
                    this.cell_text = result.ToString("X");

                    break;

            }
        }
    }
}