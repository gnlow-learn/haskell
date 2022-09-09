export const quicksort = ([x, ...xs]: number[]) => {
    if (x) {
        const ys = xs.filter(a => a <= x)
        const zs = xs.filter(b => b > x)
        return [...quicksort(ys), x, ...quicksort(zs)]
    } else {
        return []
    }
}