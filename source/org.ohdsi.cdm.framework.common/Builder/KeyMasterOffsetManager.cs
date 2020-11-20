using System.Collections.Concurrent;
using System.Threading;

namespace org.ohdsi.cdm.framework.common.Builder
{
    public class KeyMasterOffsetManager
    {
        private ConcurrentDictionary<long, int> PersonIndexes;
        private ConcurrentDictionary<int, KeyMasterOffset> KeyOffsets;
        private int _chunkId;
        private int _prefix;
        private int _attempt;
        private int _personIndex;
        public KeyMasterOffsetManager(int chunkId, int prefix, int attempt)
        {
            PersonIndexes = new ConcurrentDictionary<long, int>();
            KeyOffsets = new ConcurrentDictionary<int, KeyMasterOffset>();
            _chunkId = chunkId;
            _prefix = prefix;
            _attempt = attempt;
            _personIndex = 0;
        }

        public KeyMasterOffset GetKeyOffset(long personId)
        {
            var personIndex = GetPersonIndex(personId);
            KeyOffsets.TryAdd(personIndex, new KeyMasterOffset());

            return KeyOffsets[personIndex];
        }

        private int GetPersonIndex(long personId)
        {
            if (PersonIndexes.TryAdd(personId, 0))
            {
                Interlocked.Increment(ref _personIndex);
                PersonIndexes[personId] = _personIndex;
            }
            else
            {

            }

            return PersonIndexes[personId];
        }

        public long GetId(long personId, long id)
        {
            var personIndex = GetPersonIndex(personId);

            return _attempt * 1000000000000000000 + _chunkId * 1000000000000000 + _prefix * 1000000000000 + personIndex * 10000000L + id;
        }
    }
}
