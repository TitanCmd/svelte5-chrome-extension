export type PageType = "home" | "settings" | "help" | "components";

export let currentPage = $state<PageType>("home");

export function navigateTo(page: PageType) {
  currentPage = page;
  console.log("Navigated to:", page);
}
