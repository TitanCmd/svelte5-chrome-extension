<script lang="ts">
  import type { Snippet } from "svelte";
  import { Info, CircleAlert, Check, X } from "../../icons";
  import Icon from "../Icon.svelte";

  interface Props {
    variant?: "info" | "success" | "warning" | "error";
    class?: string;
    showIcon?: boolean;
    children?: Snippet;
  }

  const VARIANT_CLASS: Record<NonNullable<Props["variant"]>, string> = {
    info: "alert-info",
    success: "alert-success",
    warning: "alert-warning",
    error: "alert-error",
  };

  let {
    variant = "info",
    class: className = "",
    showIcon = true,
    children,
    ...rest
  }: Props = $props();

  const classes = $derived(
    ["alert", VARIANT_CLASS[variant], className].filter(Boolean).join(" ")
  );

  const iconMap = {
    info: Info,
    success: Check,
    warning: CircleAlert,
    error: X,
  };
</script>

<div class={classes} role="alert" {...rest}>
  {#if showIcon}
    <Icon icon={iconMap[variant]} size={20} />
  {/if}
  {#if children}
    <span>{@render children()}</span>
  {/if}
</div>
