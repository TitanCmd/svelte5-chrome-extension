<script lang="ts">
  import type { Snippet } from "svelte";

  interface Props {
    variant?:
      | "primary"
      | "secondary"
      | "accent"
      | "ghost"
      | "neutral"
      | "error"
      | "warning"
      | "info"
      | "success";
    size?: "xs" | "sm" | "md" | "lg";
    outline?: boolean;
    class?: string;
    children?: Snippet;
  }

  const VARIANT_CLASS: Record<NonNullable<Props["variant"]>, string> = {
    neutral: "badge-neutral",
    primary: "badge-primary",
    secondary: "badge-secondary",
    accent: "badge-accent",
    ghost: "badge-ghost",
    error: "badge-error",
    warning: "badge-warning",
    info: "badge-info",
    success: "badge-success",
  };

  const SIZE_CLASS: Record<NonNullable<Props["size"]>, string> = {
    xs: "badge-xs",
    sm: "badge-sm",
    md: "badge-md",
    lg: "badge-lg",
  };

  let {
    variant = "neutral",
    size = "md",
    outline = false,
    class: className = "",
    children,
    ...rest
  }: Props = $props();

  const classes = $derived(
    [
      "badge",
      VARIANT_CLASS[variant],
      outline && "badge-outline",
      SIZE_CLASS[size],
      className,
    ]
      .filter(Boolean)
      .join(" ")
  );
</script>

<span class={classes} {...rest}>
  {#if children}
    {@render children()}
  {/if}
</span>
