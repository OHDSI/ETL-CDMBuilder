using System;

namespace org.ohdsi.cdm.framework.common.PregnancyAlgorithm
{
    public class Event : IEquatable<Event>
    {
        public int EventId { get; set; }
        public Guid Guid { get; set; }
        public long PersonId { get; set; }
        public string Category { get; set; }
        public DateTime Date { get; set; }
        public DateTime OriginalDate { get; set; }
        public decimal? GestValue { get; set; }

        public DateTime EpisodeStartDate
        {
            get
            {
                switch (Category)
                {
                    case "LMP":
                    case "CONTRA":
                        return Date;

                    case "GEST":
                        return Date.AddDays(-1 * (double)GestValue.Value + 1);

                    case "OVUL":
                    case "OVUL2":
                        return Date.AddDays(-13);

                    case "NULS":
                        return Date.AddDays(-89);

                    case "AFP":
                        return Date.AddDays(-123);

                    case "AMEN":
                    case "UP":
                    case "PCONF":
                    case "AGP":
                    case "PCOMP":
                    case "TA":
                        return Date.AddDays(-55);

                    default:
                        return Date;
                }
            }
        }

        public int Rank
        {
            get
            {
                switch (Category)
                {
                    case "LMP":
                        return 1;

                    case "GEST":
                        return 2;

                    case "OVUL":
                        return 3;

                    case "OVUL2":
                        return 4;

                    case "NULS":
                        return 5;

                    case "AFP":
                        return 6;

                    case "AMEN":
                        return 80;

                    case "UP":
                        return 90;

                    default:
                        return 99;
                }
            }
        }

        public Event()
        {
            Guid = Guid.NewGuid();
        }

        public bool Equals(Event other)
        {
            return this.PersonId.Equals(other.PersonId) &&
                   this.Category == other.Category &&
                   this.Date == other.Date &&
                   this.GestValue == other.GestValue;
        }

        public override int GetHashCode()
        {
            return this.PersonId.GetHashCode() ^
                   this.Category.GetHashCode() ^
                   this.Date.GetHashCode() ^
                   this.GestValue.GetHashCode();
        }
    }
}