#include "includes/system.h"
typedef struct mem_block
{
	unsigned int start;
	unsigned int size;
	
} mem_block_t;
typedef struct mem_blocks
{
	mem_block_t *tree_root;
	bool (*comparison_fn_t)(mem_block_t*, mem_block_t*);
} mem_blocks_t;

mem_blocks_t free_blocks;
mem_blocks_t used_blocks;

mem_blocks_t *free = &free_blocks;
mem_blocks_t *used = &used_blocks;

void init_memory_manager()
{
	unsigned int mmap_size = mboot_info->mmap_length;
	free->tree_root = 0;
}
