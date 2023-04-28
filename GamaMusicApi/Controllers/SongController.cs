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

namespace GamaMusicApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SongController : ControllerBase
    {
        [HttpGet("GetAllSongs")]
        public ActionResult GetAllSongs()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetAllSongs"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }
        [HttpGet("GetAllAvailableSongs")]
        public ActionResult GetAllAvailableAlbums()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetAllAvailableSongs"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostAddSong")]
        public ActionResult PostAddSong([FromBody] Song.addSong addSong)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { addSong.Name, addSong.FK_Album, addSong.year, addSong.Gender, addSong.Length };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AddSong", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
                //si ya existe retorna []
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostDeleteSong")]
        public ActionResult PostDeleteSong([FromBody] Song.DelSong DelSong)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { DelSong.Name, DelSong.FK_Album, DelSong.year, DelSong.Gender };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_DelSong", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));

            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostUpdateSong")]
        public ActionResult PostUpdateSong([FromBody] Song.UpdSong UpdSong)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { UpdSong.Name, UpdSong.FK_Album, UpdSong.year, UpdSong.Gender, UpdSong.Length, UpdSong.BfName, UpdSong.BfFK_Album, UpdSong.Bfyear, UpdSong.BfGender, UpdSong.BfLength };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_UpdSong", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
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
