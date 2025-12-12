export type PageType = "home" | "settings" | "help" | "components";

export const navigationState = $state<{ currentPage: PageType }>({
  currentPage: "home",
});

export function navigateTo(page: PageType) {
  navigationState.currentPage = page;
  console.log("Navigated to:", page);
}
