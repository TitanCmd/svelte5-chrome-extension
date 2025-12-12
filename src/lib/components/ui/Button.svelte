<script lang="ts">
  import type { Snippet } from "svelte";

  interface Props {
    variant?:
      | "primary"
      | "secondary"
      | "accent"
      | "ghost"
      | "link"
      | "neutral"
      | "error"
      | "warning"
      | "info"
      | "success";
    size?: "xs" | "sm" | "md" | "lg";
    outline?: boolean;
    wide?: boolean;
    block?: boolean;
    circle?: boolean;
    square?: boolean;
    loading?: boolean;
    disabled?: boolean;
    class?: string;
    onclick?: () => void;
    type?: "button" | "submit" | "reset";
    children?: Snippet;
  }

  const VARIANT_CLASS: Record<NonNullable<Props["variant"]>, string> = {
    neutral: "",
    primary: "btn-primary",
    secondary: "btn-secondary",
    accent: "btn-accent",
    ghost: "btn-ghost",
    link: "btn-link",
    error: "btn-error",
    warning: "btn-warning",
    info: "btn-info",
    success: "btn-success",
  };

  const SIZE_CLASS: Record<NonNullable<Props["size"]>, string> = {
    xs: "btn-xs",
    sm: "btn-sm",
    md: "btn-md",
    lg: "btn-lg",
  };

  let {
    variant = "neutral",
    size = "md",
    outline = false,
    wide = false,
    block = false,
    circle = false,
    square = false,
    loading = false,
    disabled = false,
    class: className = "",
    onclick,
    type = "button",
    children,
    ...rest
  }: Props = $props();

  const classes = $derived(
    [
      "btn",
      VARIANT_CLASS[variant],
      outline && "btn-outline",
      SIZE_CLASS[size],
      wide && "btn-wide",
      block && "btn-block",
      circle && "btn-circle",
      square && "btn-square",
      loading && "btn-disabled loading",
      className,
    ]
      .filter(Boolean)
      .join(" ")
  );
</script>

<button {type} class={classes} {disabled} {onclick} {...rest}>
  {#if children}
    {@render children()}
  {/if}
</button>
