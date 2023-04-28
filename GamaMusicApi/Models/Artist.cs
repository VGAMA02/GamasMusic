namespace GamaMusicApi.Models
{
    public class Artist
    {
        public class AddArtist
        {
            public string Name { get; set; } = string.Empty;
            public string Nationality { get; set; } = string.Empty;
            public int year { get; set; } = 0;
        }

        public class DeleteArtist
        {
            public string Name { get; set; } = string.Empty;
            public string Nationality { get; set; } = string.Empty;
            public int year { get; set; } = 0;
        }

        public class UpdateArtist
        {
            public string Name { get; set; } = string.Empty;
            public string Nationality { get; set; } = string.Empty;
            public int year { get; set; } = 0;

            public string BfName { get; set; } = string.Empty;
            public string BfNationality { get; set; } = string.Empty;
            public int Bfyear { get; set; } = 0;
        }





    }
}
