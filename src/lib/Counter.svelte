<script lang="ts">
  let count: number = $state(0);
  const increment = () => {
    count++;
  };
</script>

<button onclick={increment}>
  count is {count}
</button>
