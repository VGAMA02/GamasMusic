namespace GamaMusicApi.Models
{
    public class Song
    {
        public class addSong
        {
            public string Name { get; set; } = string.Empty;
            public string FK_Album { get; set; } = string.Empty;
            public int year { get; set; } = 0;
            public string Gender { get; set; } = string.Empty;
            public string Length { get; set; } = string.Empty;
        }

        public class DelSong
        {
            public string Name { get; set; } = string.Empty;
            public string FK_Album { get; set; } = string.Empty;
            public int year { get; set; } = 0;
            public string Gender { get; set; } = string.Empty;
            //public string Length { get; set; } = string.Empty;
        }

        public class UpdSong
        {
            public string Name { get; set; } = string.Empty;
            public string FK_Album { get; set; } = string.Empty;
            public int year { get; set; } = 0;
            public string Gender { get; set; } = string.Empty;
            public string Length { get; set; } = string.Empty;

            public string BfName { get; set; } = string.Empty;
            public string BfFK_Album { get; set; } = string.Empty;
            public int Bfyear { get; set; } = 0;
            public string BfGender { get; set; } = string.Empty;
            public string BfLength { get; set; } = string.Empty;
        }


    }
}
