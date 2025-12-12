<script lang="ts">
  import { onMount } from "svelte";
  import { theme, initializeTheme } from "./lib/stores/theme";
  import { navigationState } from "./lib/stores/navigation.svelte";

  import ThemeController from "./lib/components/ThemeController.svelte";
  import Nav from "./lib/components/Nav.svelte";

  // Pages
  import HomePage from "./lib/pages/HomePage.svelte";
  import SettingsPage from "./lib/pages/SettingsPage.svelte";
  import HelpPage from "./lib/pages/HelpPage.svelte";
  import ComponentsDemo from "./lib/pages/ComponentsDemo.svelte";

  onMount(() => {
    initializeTheme();
  });
</script>

<div class="h-screen bg-base-300" data-theme={$theme}>
  <div class="flex flex-col h-full">
    <main class="flex-1 p-4 pb-20 overflow-y-auto">
      <!-- Theme Switcher -->
      <div class="flex justify-end mb-4">
        <ThemeController />
      </div>

      <!-- Page Content -->
      <div class="max-w-4xl mx-auto">
        {#if navigationState.currentPage === "home"}
          <HomePage />
        {:else if navigationState.currentPage === "settings"}
          <SettingsPage />
        {:else if navigationState.currentPage === "help"}
          <HelpPage />
        {:else if navigationState.currentPage === "components"}
          <ComponentsDemo />
        {/if}
      </div>
    </main>

    <!-- Navigation -->
    <Nav />
  </div>
</div>
