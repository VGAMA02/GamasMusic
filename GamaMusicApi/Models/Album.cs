namespace GamaMusicApi.Models
{
    public class Album
    {
        public class AddAlbum
        {
            public string Name { get; set; } = string.Empty;
            public string FK_Artist { get; set; } = string.Empty;
            public int year { get; set; } = 0;
        }

        public class DelAlbum
        {
            public string Name { get; set; } = string.Empty;
            public string FK_Artist { get; set; } = string.Empty;
            public int year { get; set; } = 0;
        }

        public class UpdAlbum
        {
            public string Name { get; set; } = string.Empty;
            public string FK_Artist { get; set; } = string.Empty;
            public int year { get; set; } = 0;

            public string BfName { get; set; } = string.Empty;
            public string BfFK_Artist { get; set; } = string.Empty;
            public int Bfyear { get; set; } = 0;
        }


    }
}
