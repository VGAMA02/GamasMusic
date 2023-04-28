using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Configuration;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using System.Data.Common;
using System.Data;
using Newtonsoft.Json;
using GamaMusicApi.Models;
using GamaMusicApi.Utilities;
using static GamaMusicApi.Models.Artist;

namespace GamaMusicApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ArtistController : ControllerBase
    {

        [HttpGet("GetAllArtist")]
        public ActionResult GetAllArtist()
        {
            var Message = String.Empty;
            try
            {
                //var connection = new Microsoft.Data.SqlClient.SqlConnection(connectionString.returnConnection());
                QuerysHelper QHelper = new QuerysHelper(); //obtener conexion de otra clase
                var connection = QHelper.returnConnection();
                connection.Open();


                var SqlCommand = new Microsoft.Data.SqlClient.SqlCommand("SELECT * FROM CT_Artist", connection);
                var SqlDataAdapter = new Microsoft.Data.SqlClient.SqlDataAdapter(SqlCommand);
                DataTable dataTable = new DataTable();
                SqlDataAdapter.Fill(dataTable);
                connection.Close();
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpGet("GetAllAvailableArtist")]
        public ActionResult GetAllAvailableArtist()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetAllAvailableArtist"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostAddArtist")]
        public ActionResult PostAddArtist([FromBody] Artist.AddArtist AddArtist)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper(); 
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { AddArtist.Name ,AddArtist.Nationality, AddArtist.year }; 
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AddArtist", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
                //si ya existe retorna []
            }
            catch(Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostDeleteArtist")]
        public ActionResult PostDeleteArtist([FromBody] Artist.DeleteArtist DelArtist)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { DelArtist.Name, DelArtist.Nationality, DelArtist.year };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_DelArtist", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));

            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostUpdateArtist")]
        public ActionResult PostUpdateArtist([FromBody] Artist.UpdateArtist UpdArtist)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { UpdArtist.BfName, UpdArtist.BfNationality, UpdArtist.Bfyear, UpdArtist.Name, UpdArtist.Nationality, UpdArtist.year };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_UpdArtist", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));

            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }



















        //zona de pre-code


        // FUNCION PostAddArtist
        //obtener conexion de otra clase
        // var connection = new Microsoft.Data.SqlClient.SqlConnection(connectionString.returnConnection());
        /*  var connection = QHelper.returnConnection();
        connection.Open();

        string commmand = "EXEC dbo.Up_AddArtist '" + AddArtist.Name + "','" + AddArtist.Nationality + "'," + AddArtist.year.ToString(); 
        var SqlCommand = new Microsoft.Data.SqlClient.SqlCommand(commmand, connection);
        var SqlDataAdapter = new Microsoft.Data.SqlClient.SqlDataAdapter(SqlCommand);
        DataTable dataTable = new DataTable();
        SqlDataAdapter.Fill(dataTable);
       */
    }
}
