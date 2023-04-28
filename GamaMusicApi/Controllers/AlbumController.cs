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
using static GamaMusicApi.Models.Album;

namespace GamaMusicApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AlbumController : ControllerBase
    {
        [HttpGet("GetAllAlbums")]
        public ActionResult GetAllAlbums()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetALLAlbums"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }
        [HttpGet("GetAllAvailableAlbums")]
        public ActionResult GetAllAvailableAlbums()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetAllAvailableAlbum"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostAddAlbum")]
        public ActionResult PostAddAlbum([FromBody] Album.AddAlbum AddAlbum)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { AddAlbum.Name, AddAlbum.FK_Artist, AddAlbum.year };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AddAlbum", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
               
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostDelAlbum")]
        public ActionResult PostDelAlbum([FromBody] Album.DelAlbum DelAlbum)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { DelAlbum.Name, DelAlbum.FK_Artist, DelAlbum.year };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_DelAlbum", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
              
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostUpdAlbum")]
        public ActionResult PostUpdAAlbum([FromBody] Album.UpdAlbum UpdAlbum)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { UpdAlbum.Name, UpdAlbum.FK_Artist, UpdAlbum.year, UpdAlbum.BfName, UpdAlbum.BfFK_Artist, UpdAlbum.Bfyear };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_UpdAlbum", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }






    }
}
